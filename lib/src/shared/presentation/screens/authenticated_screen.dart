import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/map/presentation/providers/icars_position_map_stream.dart';
import 'package:icar/src/features/notification/presentation/providers/launched_with_notification.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/presentation/providers/tickets_proximity_map_stream.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class AuthenticatedScreen extends ConsumerWidget {
  const AuthenticatedScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(icarsPositionMapStreamProvider);
    ref.watch(ticketsProximityMapStreamProvider);
    ref.watch(launchedWithNotificationProvider);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => navigationShell.goBranch(index),
        selectedIndex: navigationShell.currentIndex,
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
      body: navigationShell,
    );
  }
}
