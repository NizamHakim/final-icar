import 'package:permission_handler/permission_handler.dart';

Future<bool> checkForNotificationPermission() async {
  final status = await Permission.notification.isGranted;
  return status;
}
