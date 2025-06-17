import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/profile/widgets/switch_language/confirm_lang_switch_dialog.dart';

class SwitchLangTile extends ConsumerWidget {
  const SwitchLangTile({super.key, required this.appLocale});

  final AppLocale appLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    return ListTile(
      title: RichText(
        text: TextSpan(
          text: appLocale.text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.gray900,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: " (${appLocale.locale.languageCode.toUpperCase()})",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.gray500,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      trailing:
          (currentLocale == appLocale.locale)
              ? const AppIcon(
                iconSvg: AppIconsSvg.check,
                color: AppColors.success500,
              )
              : null,
      onTap:
          (currentLocale == appLocale.locale)
              ? null
              : () {
                showDialog(
                  context: context,
                  builder:
                      (context) =>
                          ConfirmLangSwitchDialog(appLocale: appLocale),
                );
              },
    );
  }
}
