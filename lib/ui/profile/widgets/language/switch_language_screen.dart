import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/profile_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/profile/widgets/language/switch_lang_tile.dart';

class SwitchLanguageScreen extends ConsumerWidget {
  const SwitchLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = ref.watch(supportedLocalesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        elevation: 0.1,
        shadowColor: AppColors.black,
        scrolledUnderElevation: 0.1,
        title: Text(
          ProfileLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: RootContainer(
        child: ListView.builder(
          itemCount: supportedLocales.length,
          itemBuilder: (context, index) {
            return SwitchLangTile(appLocale: supportedLocales[index]);
          },
        ),
      ),
    );
  }
}
