import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/features/ticket/screens/ticket_details_screen.dart';
import 'package:icar/core/navigator_key.dart';
import 'package:icar/core/notifications/payload/notification_payload.dart';
import 'package:icar/util/show_review_sheet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

part 'notifications_plugin.g.dart';

@Riverpod(keepAlive: true)
class NotificationsPlugin extends _$NotificationsPlugin {
  @override
  FlutterLocalNotificationsPlugin? build() {
    return null;
  }

  void setPlugin(FlutterLocalNotificationsPlugin? notificationsPlugin) async {
    state = notificationsPlugin;
  }
}

@riverpod
Future<void> initializeNotificationsPlugin(Ref ref) async {
  initializeTimeZones();
  setLocalLocation(getLocation('Asia/Jakarta'));

  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  const androidSettings = AndroidInitializationSettings(
    '@mipmap/launcher_icon',
  );
  const iosSettings = DarwinInitializationSettings();
  const initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await notificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      if (details.payload != null) {
        final payload = NotificationPayload.fromJson(
          jsonDecode(details.payload!),
        );
        handleNotification(payload);
      }
    },
  );

  ref.read(notificationsPluginProvider.notifier).setPlugin(notificationsPlugin);
}

void handleNotification(NotificationPayload payload) {
  switch (payload.type) {
    case NotificationType.TICKET_DETAILS:
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => TicketDetailsScreen(ticketId: payload.ticketId),
        ),
        (route) => route.isFirst,
      );
      break;
    case NotificationType.TICKET_REVIEW:
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => TicketDetailsScreen(ticketId: payload.ticketId),
        ),
        (route) => route.isFirst,
      );
      showReviewSheet(navigatorKey.currentContext!, payload.ticketId);
      break;
  }
}

@riverpod
Future<void> launchedWithNotification(Ref ref) async {
  final notificationPlugin = ref.read(notificationsPluginProvider)!;
  final notificationAppLaunchDetails =
      await notificationPlugin.getNotificationAppLaunchDetails();

  if (notificationAppLaunchDetails!.didNotificationLaunchApp) {
    final payload = NotificationPayload.fromJson(
      jsonDecode(notificationAppLaunchDetails.notificationResponse!.payload!),
    );
    handleNotification(payload);
  }
}
