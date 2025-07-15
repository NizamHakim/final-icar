import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/core/permissions/location/widgets/location_permission_denied_rationale.dart';
import 'package:icar/core/permissions/location/widgets/location_service_disabled_rationale.dart';

class LocationPermissionManager {
  static Future<void> checkForPermissionOrThrow() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw const LocationServiceDisabledException();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const PermissionDeniedException('Location permission denied');
    }
  }

  static Future<void> requestForService() async {
    await Geolocator.openLocationSettings();
  }

  static Future<void> requestForPermission(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!context.mounted) return;
      await showServiceDisabledRationale(context);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (!context.mounted) return;
        await showPermissionDisabledRationale(context, permission);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!context.mounted) return;
      await showPermissionDisabledRationale(context, permission);
      return;
    }
  }

  static void requestForPermissionDeniedForever() {
    Geolocator.openAppSettings();
  }

  static Future<void> showServiceDisabledRationale(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const LocationServiceDisabledRationale(),
    );
  }

  static Future<void> showPermissionDisabledRationale(
    BuildContext context,
    LocationPermission permission,
  ) async {
    await showDialog(
      context: context,
      builder:
          (context) =>
              LocationPermissionDeniedRationale(permission: permission),
    );
  }
}
