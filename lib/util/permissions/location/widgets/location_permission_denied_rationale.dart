import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/util/permissions/location/location_permission_manager.dart';

class LocationPermissionDeniedRationale extends StatelessWidget {
  const LocationPermissionDeniedRationale({
    super.key,
    required this.permission,
  });

  final LocationPermission permission;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Location Permission Disabled",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: Text(
        "Please enable location permission on your device to proceed.",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.gray500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (permission == LocationPermission.deniedForever) {
              LocationPermissionManager.requestForPermissionDeniedForever();
            } else {
              await LocationPermissionManager.requestForPermission(context);
            }
            if (!context.mounted) return;
            Navigator.of(context).pop();
          },
          child: Text(
            "Grant Permission",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
