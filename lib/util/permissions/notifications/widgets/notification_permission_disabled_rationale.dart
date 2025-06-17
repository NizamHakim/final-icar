import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/permission_localizations.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class NotificationPermissionDisabledRationale extends StatelessWidget {
  const NotificationPermissionDisabledRationale({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        PermissionLocalizations.of(context)!.notificationPermissionTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: Text(
        PermissionLocalizations.of(context)!.notificationPermissionDesc,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.gray500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            PermissionLocalizations.of(context)!.stayDisabled,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (!context.mounted) return;
            Navigator.of(context).pop(true);
          },
          child: Text(
            PermissionLocalizations.of(context)!.grantPermission,
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
