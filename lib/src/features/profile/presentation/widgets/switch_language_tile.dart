import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/features/profile/presentation/widgets/confirm_language_dialog.dart';
import 'package:icar/src/l10n/generated/profile_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class SwitchLanguageTile extends ConsumerWidget {
  const SwitchLanguageTile({super.key, required this.locale});

  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    return ListTile(
      title: RichText(
        text: TextSpan(
          text: ProfileLocalizations.of(
            context,
          )!.languageTileLabel(locale.languageCode),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.gray900,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: " (${locale.languageCode.toUpperCase()})",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.gray500,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      trailing:
          (currentLocale == locale)
              ? const AppIcon(
                iconSvg: AppIconsSvg.check,
                color: AppColors.success500,
              )
              : null,
      onTap:
          (currentLocale == locale)
              ? null
              : () {
                showDialog(
                  context: context,
                  builder: (context) => ConfirmLanguageDialog(locale: locale),
                );
              },
    );
  }
}
