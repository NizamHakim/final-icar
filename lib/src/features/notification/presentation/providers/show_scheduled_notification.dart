import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

Future<void> showScheduledNotification(
  FlutterLocalNotificationsPlugin notificationsPlugin,
  int id,
  String title,
  String body,
  DateTime scheduledTime, {
  String? payload,
}) async {
  TZDateTime scheduledTZTime = TZDateTime(
    local,
    scheduledTime.year,
    scheduledTime.month,
    scheduledTime.day,
    scheduledTime.hour,
    scheduledTime.minute,
    scheduledTime.second,
  );

  await notificationsPlugin.zonedSchedule(
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
