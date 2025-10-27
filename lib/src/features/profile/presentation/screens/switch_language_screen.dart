import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/supported_locales.dart';
import 'package:icar/src/l10n/generated/profile_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/profile/presentation/widgets/switch_language_tile.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';

class SwitchLanguageScreen extends ConsumerWidget {
  const SwitchLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            return SwitchLanguageTile(locale: supportedLocales[index]);
          },
        ),
      ),
    );
  }
}
