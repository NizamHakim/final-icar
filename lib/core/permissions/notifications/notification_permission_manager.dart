import 'package:flutter/material.dart';
import 'package:icar/core/permissions/notifications/widgets/notification_permission_disabled_rationale.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPermissionManager {
  static Future<bool> checkForPermission() async {
    final status = await Permission.notification.isGranted;
    return status;
  }

  static Future<void> requestForPermission(BuildContext context) async {
    final permissionStatus = await Permission.notification.request();

    if (permissionStatus.isDenied) {
      if (!context.mounted) return;
      bool shouldReprompt = await showDialog(
        context: context,
        builder: (context) => const NotificationPermissionDisabledRationale(),
      );

      if (shouldReprompt) {
        await Permission.notification.request();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      if (!context.mounted) return;
      bool shouldReprompt = await showDialog(
        context: context,
        builder: (context) => const NotificationPermissionDisabledRationale(),
      );

      if (shouldReprompt) {
        await openAppSettings();
      }
    }
  }
}
