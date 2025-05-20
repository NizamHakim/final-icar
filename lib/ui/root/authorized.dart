import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/mapbox_token.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/providers/bottom_nav_index.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/home/screens/home_screen.dart';
import 'package:icar/ui/profile/screens/profile_screen.dart';
import 'package:icar/ui/queue/screens/my_queue_screen.dart';

class Authorized extends ConsumerWidget {
  const Authorized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentPageIndex = ref.watch(bottomNavIndexProvider);
    final mapboxToken = ref.watch(mapboxTokenProvider);

    return Scaffold(
      bottomNavigationBar: mapboxToken.when(
        data: (_) {
          return NavigationBar(
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
                label: 'Beranda',
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
                label: 'Antrean Saya',
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
                label: 'Profile',
              ),
            ],
          );
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      ),
      body: mapboxToken.when(
        data: (data) {
          return <Widget>[
            const HomeScreen(),
            const MyQueueScreen(),
            const ProfileScreen(),
          ][currentPageIndex];
        },
        error: (error, stackTrace) {
          return RootContainer(child: Center(child: Text('Error: $error')));
        },
        loading: () {
          return const RootContainer(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
