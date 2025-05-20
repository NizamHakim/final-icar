import 'package:flutter/material.dart';
import 'package:icar/ui/core/errors/location_rationale.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPermissionManager {
  static Future<bool> requestPermission(BuildContext context) async {
    final status = await Permission.notification.request();

    if (status.isGranted) {
      return true;
    } else {
      if (!context.mounted) return false;

      final rationaleResult = await showDialog<bool>(
        context: context,
        builder: (context) => const LocationRationale(),
      );

      if (rationaleResult == false || rationaleResult == null) return false;

      if (status.isDenied) {
        final status2 = await Permission.notification.request();
        return status2.isGranted;
      }

      if (status.isPermanentlyDenied) openAppSettings();

      return false;
    }
  }
}
