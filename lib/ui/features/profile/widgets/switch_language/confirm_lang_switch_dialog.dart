import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/profile_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/locales/locales.dart';
import 'package:icar/ui/themes/app_colors.dart';

class ConfirmLangSwitchDialog extends ConsumerWidget {
  const ConfirmLangSwitchDialog({super.key, required this.appLocale});

  final AppLocale appLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        ProfileLocalizations.of(context)!.switchLangDialogTitle(appLocale.text),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Text(
          ProfileLocalizations.of(context)!.switchLangDialogDescription,
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
              color: AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(currentLocaleProvider.notifier)
                .setLocale(appLocale.locale);
            Navigator.of(context).pop();
          },
          child: Text(
            CoreLocalizations.of(context)!.confirm,
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
