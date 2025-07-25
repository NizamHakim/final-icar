import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/notifications_plugin/notifications_plugin.dart';
import 'package:timezone/timezone.dart';

Future<void> showNotification(
  Ref ref,
  int id,
  String title,
  String body, {
  String? payload,
}) async {
  final notificationsPlugin = ref.read(notificationsPluginProvider);
  await notificationsPlugin?.show(
    id,
    title,
    body,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'instant_notification_channel',
        'Instant Notifications',
        channelDescription: 'Channel for instant notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    ),
    payload: payload,
  );
}

Future<void> showScheduledNotification(
  Ref ref,
  int id,
  String title,
  String body,
  DateTime scheduledTime, {
  String? payload,
}) async {
  final notificationsPlugin = ref.read(notificationsPluginProvider);
  TZDateTime scheduledTZTime = TZDateTime(
    local,
    scheduledTime.year,
    scheduledTime.month,
    scheduledTime.day,
    scheduledTime.hour,
    scheduledTime.minute,
    scheduledTime.second,
  );

  await notificationsPlugin?.zonedSchedule(
    id,
    title,
    body,
    scheduledTZTime,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'scheduled_notification_channel',
        'Scheduled Notifications',
        channelDescription: 'Channel for scheduled notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    ),
    androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    payload: payload,
  );
}
