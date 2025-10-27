import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/key/navigator_key.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/notification/domain/entities/notification_payload.dart';
import 'package:icar/src/features/notification/presentation/providers/notifications_plugin.dart';
import 'package:icar/src/features/notification/presentation/providers/show_notification.dart';
import 'package:icar/src/features/notification/presentation/providers/show_scheduled_notification.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/features/ticket/domain/repositories/ticket_repository.dart';
import 'package:icar/src/l10n/generated/notification_localizations.dart';
import 'package:icar/src/features/ticket/presentation/providers/refresh_tickets_state.dart';

void handleTicketProximityClose(Ref ref, int ticketId) {
  final notificationPlugin = ref.read(notificationsPluginProvider).requireValue;

  showNotification(
    notificationPlugin,
    ticketId,
    NotificationLocalizations.of(
      navigatorKey.currentContext!,
    )!.icarCloseNotificationTitle,
    NotificationLocalizations.of(
      navigatorKey.currentContext!,
    )!.icarCloseNotificationBody,
    payload: jsonEncode(
      TicketDetailsNotification(
        notificationType: "ticketDetails",
        ticketId: ticketId,
      ).toJson(),
    ),
  );
}

void handleTicketProximityArrived(Ref ref, int ticketId) async {
  final ticketRepository = ref.read(ticketRepositoryProvider);
  final currentUser = ref.read(currentUserProvider).requireValue!;
  final ticketEither = await ticketRepository.updateStatus(
    currentUser.token,
    ticketId,
    TicketStatus.FINISHED,
  );

  ticketEither.fold(
    (failure) {
      return;
    },
    (ticket) {
      refreshTicketById(ref, ticketId);
      refreshTicketsState(ref);

      final notificationPlugin =
          ref.read(notificationsPluginProvider).requireValue;

      showNotification(
        notificationPlugin,
        ticketId,
        NotificationLocalizations.of(
          navigatorKey.currentContext!,
        )!.icarArrivedNotificationTitle,
        NotificationLocalizations.of(
          navigatorKey.currentContext!,
        )!.icarArrivedNotificationBody,
        payload: jsonEncode(
          TicketDetailsNotification(
            notificationType: "ticketDetails",
            ticketId: ticketId,
          ).toJson(),
        ),
      );

      showScheduledNotification(
        notificationPlugin,
        ticketId,
        NotificationLocalizations.of(
          navigatorKey.currentContext!,
        )!.reviewNotificationTitle,
        NotificationLocalizations.of(
          navigatorKey.currentContext!,
        )!.reviewNotificationBody,
        DateTime.now().add(const Duration(minutes: 15)),
        payload: jsonEncode(
          TicketReviewNotification(
            notificationType: "review",
            ticketId: ticketId,
          ).toJson(),
        ),
      );
    },
  );
}
