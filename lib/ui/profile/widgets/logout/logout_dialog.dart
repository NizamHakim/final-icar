import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/profile_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/profile/viewmodels/logout_viewmodel/logout_viewmodel.dart';
import 'package:icar/ui/root/unauthorized.dart';

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
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            CoreLocalizations.of(context)!.cancel,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            ref.read(logoutProvider);
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Unauthorized(logout: true),
              ),
            );
          },
          child: Text(
            CoreLocalizations.of(context)!.logout,
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
