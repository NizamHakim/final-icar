import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/permission_localizations.dart';
import 'package:icar/core/providers/user_location/user_location.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/core/permissions/location/location_permission_manager.dart';

class LocationServiceDisabled extends ConsumerWidget {
  const LocationServiceDisabled({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              PermissionLocalizations.of(context)!.locationServiceError,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {
              await LocationPermissionManager.requestForService();
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
              PermissionLocalizations.of(context)!.enable,
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
