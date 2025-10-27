import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/notification/presentation/providers/request_for_notification_permission.dart';
import 'package:icar/src/l10n/generated/notification_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class NotificationPermissionDisabledDialog extends StatelessWidget {
  const NotificationPermissionDisabledDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        NotificationLocalizations.of(context)!.notificationPermissionTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: Text(
        NotificationLocalizations.of(context)!.notificationPermissionDesc,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.gray500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            NotificationLocalizations.of(context)!.stayDisabled,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await requestForNotificationPermission();
            if (!context.mounted) return;
            context.pop();
          },
          child: Text(
            NotificationLocalizations.of(context)!.grantPermission,
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
