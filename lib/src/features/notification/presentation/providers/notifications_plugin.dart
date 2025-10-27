import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/notification/domain/entities/notification_payload.dart';
import 'package:icar/src/features/notification/presentation/providers/handle_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

part 'notifications_plugin.g.dart';

@riverpod
Future<FlutterLocalNotificationsPlugin> notificationsPlugin(Ref ref) async {
  // initialized by di in main using initializeNotificationPlugin
  throw UnimplementedError();
}

Future<FlutterLocalNotificationsPlugin> initializeNotificationPlugin() async {
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

  return notificationsPlugin;
}
