import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showNotification(
  FlutterLocalNotificationsPlugin notificationsPlugin,
  int id,
  String title,
  String body, {
  String? payload,
}) async {
  await notificationsPlugin.show(
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
