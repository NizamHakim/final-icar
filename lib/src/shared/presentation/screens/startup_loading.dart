import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class StartupLoading extends StatelessWidget {
  const StartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const AppIcon(
              iconSvg: AppIconsSvg.home,
              color: AppColors.primary600,
            ),
            icon: AppIcon(
              iconSvg: AppIconsSvg.homeOutline,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            label: SharedLocalizations.of(context)!.bottomNavHome,
          ),
          NavigationDestination(
            selectedIcon: const AppIcon(
              iconSvg: AppIconsSvg.list,
              color: AppColors.primary600,
            ),
            icon: AppIcon(
              iconSvg: AppIconsSvg.list,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            label: SharedLocalizations.of(context)!.bottomNavMyQueue,
          ),
          NavigationDestination(
            selectedIcon: const AppIcon(
              iconSvg: AppIconsSvg.person,
              color: AppColors.primary600,
            ),
            icon: AppIcon(
              iconSvg: AppIconsSvg.personOutline,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            label: SharedLocalizations.of(context)!.bottomNavProfile,
          ),
        ],
      ),
      body: const SizedBox.expand(),
    );
  }
}
