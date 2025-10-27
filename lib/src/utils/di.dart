import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:icar/src/features/notification/presentation/providers/notifications_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<(SharedPreferences, FlutterLocalNotificationsPlugin)> di() async {
  await dotenv.load(fileName: ".env");
  return (
    await SharedPreferences.getInstance(),
    await initializeNotificationPlugin(),
  );
}
