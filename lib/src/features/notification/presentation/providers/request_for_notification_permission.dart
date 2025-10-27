import 'package:permission_handler/permission_handler.dart';

Future<void> requestForNotificationPermission() async {
  final permissionStatus = await Permission.notification.request();

  if (permissionStatus.isDenied) {
    await Permission.notification.request();
    return;
  }

  if (permissionStatus.isPermanentlyDenied) {
    await openAppSettings();
    return;
  }
}
