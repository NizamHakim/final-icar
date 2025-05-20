import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/ui/core/errors/location_rationale.dart';
import 'package:icar/ui/core/errors/rationale_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationManager {
  static Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static Future<bool> requestPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      if (!context.mounted) return false;
      await showDialog(
        context: context,
        builder:
            (context) => const RationaleDialog(
              title: "Permission Request",
              description: "pls alow",
            ),
      );

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!context.mounted) return false;
      await showDialog(
        context: context,
        builder:
            (context) => const RationaleDialog(
              title: "Permission Request",
              description: "pls alow form settins",
            ),
      );

      openAppSettings();
      return false;
    }

    return true;
  }

  static Future<bool> isAvailable() async {
    bool isLocationServiceEnabled = await _checkLocationService();
    bool isPermissionGranted = await _checkPermission();

    return isLocationServiceEnabled && isPermissionGranted;
  }

  static Future<bool> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const PermissionDeniedException(
        "Location permission has not been granted",
      );
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  static Future<bool> _checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }
    return serviceEnabled;
  }
}
