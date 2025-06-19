import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:icar/util/refresh_tickets_state/refresh_tickets_state.dart';
import 'package:icar/util/show_notification/notification_payload.dart';
import 'package:icar/util/show_notification/show_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geofencing_tickets_inqueue.g.dart';

@Riverpod(keepAlive: true)
Stream<Map<int, TicketDistanceStatus>> geofencingTicketsInQueue(
  Ref ref,
) async* {
  final icarPositionRepository = ref.watch(icarPositionRepositoryProvider);
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final currentUser = ref.watch(currentUserProvider)!;

  final Map<int, TicketDistanceStatus> ticketDistanceStatusMap = {};

  await for (final icarResponse in icarPositionRepository.stream) {
    if (icarResponse is PositionResponse) {
      final ticketDistanceResponse = await ticketRepository
          .getTicketsDistanceStatus(currentUser.id, icarResponse);

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
  final currentLocale = ref.watch(currentLocaleProvider);

  final title =
      (currentLocale.languageCode == 'id')
          ? 'iCar sudah dekat!'
          : 'iCar is nearby!';
  final body =
      (currentLocale.languageCode == 'id')
          ? 'iCar sampai dalam beberapa menit. Ayo pergi ke halte!'
          : 'iCar will be arrived in couple of minutes. Lets go to the stop!';

  ref.read(
    showNotificationProvider(
      ticketId,
      title,
      body,
      payload: jsonEncode(
        NotificationPayload(
          type: NotificationType.TICKET_DETAILS,
          ticketId: ticketId,
        ).toJson(),
      ),
    ),
  );
}

void _handleIcarArrived(Ref ref, int ticketId) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final currentLocale = ref.watch(currentLocaleProvider);

  final title =
      (currentLocale.languageCode == 'id')
          ? 'iCar tiba di halte!'
          : 'iCar has arrived at the stop!';
  final body =
      (currentLocale.languageCode == 'id')
          ? 'Ayo naik iCar atau antre di waktu lain kalau iCar penuh!'
          : "Let's get to the iCar or queue for another time if it's fully occupied!";

  ref.read(refreshTicketByIdProvider(ticketId));
  ref.read(refreshTicketsStateProvider);
  ref.read(
    showNotificationProvider(
      ticketId,
      title,
      body,
      payload: jsonEncode(
        NotificationPayload(
          type: NotificationType.TICKET_DETAILS,
          ticketId: ticketId,
        ).toJson(),
      ),
    ),
  );

  final reviewTitle =
      (currentLocale.languageCode == 'id')
          ? 'Bagaimana pengalamanmu dengan iCar hari ini?'
          : 'How was your experience with iCar today?';

  final reviewBody =
      (currentLocale.languageCode == 'id')
          ? 'Silakan berikan penilaian dan ulasan untuk membantu kami meningkatkan layanan.'
          : 'Please rate and review to help us improve our service.';

  final ticketEither = await ticketRepository.getTicketDetails(ticketId);
  ticketEither.fold(
    (failure) {
      return;
    },
    (ticket) {
      ref.read(
        showScheduledNotificationProvider(
          ticketId,
          reviewTitle,
          reviewBody,
          DateTime.now().add(const Duration(minutes: 10)),
          payload: jsonEncode(
            NotificationPayload(
              type: NotificationType.TICKET_REVIEW,
              ticketId: ticketId,
            ).toJson(),
          ),
        ),
      );
    },
  );
}

void _handleIcarDisconnected(Ref ref, Icar icar) {
  final currentLocale = ref.watch(currentLocaleProvider);
  final title =
      (currentLocale.languageCode == 'id')
          ? '${icar.name} dinonaktifkan sementara!'
          : '${icar.name} is temporarily deactivated!';
  final body =
      (currentLocale.languageCode == 'id')
          ? 'Semua tiket yang sedang dalam antrean telah dibatalkan. Mohon maaf atas ketidaknyamanannya.'
          : "All tickets in queue have been cancelled. We apologize for the inconvenience.";

  ref.read(refreshTicketsStateProvider);
  ref.read(showNotificationProvider(icar.id, title, body));
}
