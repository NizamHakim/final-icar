import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/app_colors.dart';
import 'package:icar/ui/core/app_icons.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/profile/widgets/profile_menu_tile.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: RootContainer.roundedTop(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.surface,
              backgroundImage: const AssetImage(
                'assets/images/profile_placeholder.png',
              ),
            ),
            Text(
              "Nizam Hakim Santoso",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "5025211209@student.its.ac.id",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Material(
              color: AppColors.transparent,
              child: Column(
                children: [
                  const Divider(color: AppColors.gray100, thickness: 1),
                  ProfileMenuTile(
                    leadingIcon: AppIcons.world,
                    text: 'Ganti bahasa',
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.gray100, thickness: 1),
                  ProfileMenuTile(
                    leadingIcon: AppIcons.chat,
                    text: 'Pusat bantuan',
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.gray100, thickness: 1),
                  ProfileMenuTile(
                    leadingIcon: AppIcons.logout,
                    text: 'Keluar',
                    onTap: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                    },
                  ),
                  const Divider(color: AppColors.gray100, thickness: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
