import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/notification_localizations.dart';
import 'package:icar/core/navigator_key.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/icar_repository/icar_position/icar_position_repository.dart';
import 'package:icar/data/repositories/icar_repository/responses/icar_websocket_response.dart';
import 'package:icar/data/repositories/ticket_repository/remote/ticket_repository.dart';
import 'package:icar/util/refresh_tickets_state.dart';
import 'package:icar/core/notifications/payload/notification_payload.dart';
import 'package:icar/core/notifications/show_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geofencing_tickets_inqueue.g.dart';

@Riverpod(keepAlive: true)
Stream<Map<int, TicketDistanceStatus>> geofencingTicketsInQueue(
  Ref ref,
) async* {
  final icarPositionRepository = ref.watch(icarPositionRepositoryProvider);
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  final Map<int, TicketDistanceStatus> ticketDistanceStatusMap = {};

  await for (final icarResponse in icarPositionRepository.stream) {
    if (icarResponse is PositionResponse) {
      final ticketDistanceResponse = await ticketRepository
          .getTicketsDistanceStatus(icarResponse.position, icarResponse.icarId);

      ticketDistanceResponse.fold(
        (failure) {
          return;
        },
        (ticketDistanceList) {
          for (final ticketDistance in ticketDistanceList) {
            ticketDistanceStatusMap[ticketDistance.ticketId] =
                ticketDistance.distanceStatus;

            if (ticketDistance.distanceStatus == TicketDistanceStatus.CLOSE) {
              _handleIcarClose(ref, ticketDistance.ticketId);
            }

            if (ticketDistance.distanceStatus == TicketDistanceStatus.ARRIVED) {
              _handleIcarArrived(ref, ticketDistance.ticketId);
              ticketDistanceStatusMap.remove(ticketDistance.ticketId);
            }
          }
        },
      );
      yield ticketDistanceStatusMap;
    } else if (icarResponse is DisconnectedResponse) {
      _handleIcarDisconnected(ref, icarResponse.icar);
    }
  }
}

void _handleIcarClose(Ref ref, int ticketId) {
  showNotification(
    ref,
    ticketId,
    NotificationLocalizations.of(navigatorKey.currentContext!)!.icarCloseTitle,
    NotificationLocalizations.of(navigatorKey.currentContext!)!.icarCloseBody,
    payload: jsonEncode(
      NotificationPayload(
        type: NotificationType.TICKET_DETAILS,
        ticketId: ticketId,
      ).toJson(),
    ),
  );
}

void _handleIcarArrived(Ref ref, int ticketId) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  refreshTicketById(ref, ticketId);
  refreshTicketsState(ref);
  showNotification(
    ref,
    ticketId,
    NotificationLocalizations.of(
      navigatorKey.currentContext!,
    )!.icarArrivedTitle,
    NotificationLocalizations.of(navigatorKey.currentContext!)!.icarArrivedBody,
    payload: jsonEncode(
      NotificationPayload(
        type: NotificationType.TICKET_DETAILS,
        ticketId: ticketId,
      ).toJson(),
    ),
  );

  final ticketEither = await ticketRepository.getTicketDetails(ticketId);
  ticketEither.fold(
    (failure) {
      return;
    },
    (ticket) {
      showScheduledNotification(
        ref,
        ticketId,
        NotificationLocalizations.of(navigatorKey.currentContext!)!.reviewTitle,
        NotificationLocalizations.of(navigatorKey.currentContext!)!.reviewBody,
        DateTime.now().add(const Duration(minutes: 15)),
        payload: jsonEncode(
          NotificationPayload(
            type: NotificationType.TICKET_REVIEW,
            ticketId: ticketId,
          ).toJson(),
        ),
      );
    },
  );
}

void _handleIcarDisconnected(Ref ref, Icar icar) {
  refreshTicketsState(ref);
  showNotification(
    ref,
    icar.id,
    NotificationLocalizations.of(
      navigatorKey.currentContext!,
    )!.icarDisconnectTitle(icar.name),
    NotificationLocalizations.of(
      navigatorKey.currentContext!,
    )!.icarDisconnectBody,
  );
}
