import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/core/providers/user_location.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class LocationPermissionDenied extends ConsumerWidget {
  const LocationPermissionDenied({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              'Could not load map: Location permission has not been granted',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {
              await Geolocator.requestPermission(); // todo: unify denied and denied forever
              ref.invalidate(userLocationProvider);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary600,
              side: const BorderSide(color: AppColors.primary600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Grant permission',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
