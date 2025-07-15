import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/permission_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/core/permissions/location/location_permission_manager.dart';

class LocationServiceDisabledRationale extends StatelessWidget {
  const LocationServiceDisabledRationale({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        PermissionLocalizations.of(context)!.locationServiceTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: Text(
        PermissionLocalizations.of(context)!.locationServiceDesc,
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
            CoreLocalizations.of(context)!.cancel,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            LocationPermissionManager.requestForService();
          },
          child: Text(
            PermissionLocalizations.of(context)!.enable,
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
