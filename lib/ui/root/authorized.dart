import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/providers/bottom_nav_index.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/home/screens/home_screen.dart';
import 'package:icar/ui/profile/screens/profile_screen.dart';
import 'package:icar/ui/queue/screens/my_queue_screen.dart';

class Authorized extends ConsumerWidget {
  const Authorized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentPageIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          ref.read(bottomNavIndexProvider.notifier).set(value);
        },
        selectedIndex: currentPageIndex,
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
            label: CoreLocalizations.of(context)!.bottomNavHome,
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
            label: CoreLocalizations.of(context)!.bottomNavMyQueue,
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
            label: CoreLocalizations.of(context)!.bottomNavProfile,
          ),
        ],
      ),
      body:
          <Widget>[
            const HomeScreen(),
            const MyQueueScreen(),
            const ProfileScreen(),
          ][currentPageIndex],
    );
  }
}
