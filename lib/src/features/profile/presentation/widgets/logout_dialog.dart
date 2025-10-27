import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/profile/presentation/providers/logout.dart';
import 'package:icar/src/l10n/generated/profile_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';

class LogoutDialog extends ConsumerWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        ProfileLocalizations.of(context)!.logoutDialogTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ProfileLocalizations.of(context)!.logoutDialogDesc,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            SharedLocalizations.of(context)!.cancel,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref.read(logoutProvider);
          },
          child: Text(
            SharedLocalizations.of(context)!.logout,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.error500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
