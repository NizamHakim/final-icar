import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/location/presentation/providers/request_for_location_service.dart';
import 'package:icar/src/features/location/presentation/providers/user_location.dart';
import 'package:icar/src/l10n/generated/location_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

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
              LocationLocalizations.of(context)!.locationServiceError,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {
              await requestForLocationService();
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
              LocationLocalizations.of(context)!.enable,
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
