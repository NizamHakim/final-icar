import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/l10n/generated/profile_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';

class ConfirmLanguageDialog extends ConsumerWidget {
  const ConfirmLanguageDialog({super.key, required this.locale});

  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        ProfileLocalizations.of(
          context,
        )!.switchLangDialogTitle(locale.languageCode),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.black,
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
            ref.read(currentLocaleProvider.notifier).setLocale(locale);
            context.pop();
          },
          child: Text(
            SharedLocalizations.of(context)!.confirm,
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
