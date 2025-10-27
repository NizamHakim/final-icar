import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/key/navigator_key.dart';
import 'package:icar/src/features/notification/presentation/providers/notifications_plugin.dart';
import 'package:icar/src/features/notification/presentation/providers/show_notification.dart';
import 'package:icar/src/l10n/generated/notification_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_position.dart';
import 'package:icar/src/features/ticket/presentation/providers/refresh_tickets_state.dart';

void handleIcarDisconnected(
  Ref ref,
  IcarPosition icarPosition,
  int canceledTickets,
) {
  refreshTicketsState(ref);
  final notificationPlugin = ref.read(notificationsPluginProvider).requireValue;
  if (canceledTickets > 0) {
    showNotification(
      notificationPlugin,
      icarPosition.id,
      NotificationLocalizations.of(
        navigatorKey.currentContext!,
      )!.icarDisconnectNotificationTitle(icarPosition.name!),
      NotificationLocalizations.of(
        navigatorKey.currentContext!,
      )!.icarDisconnectNotificationBody,
    );
  }
}
