import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/profile_localizations.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/profile/viewmodels/logout/logout.dart';
import 'package:icar/ui/profile/widgets/language/switch_language_screen.dart';
import 'package:icar/ui/profile/widgets/profile_menu_tile.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(ProfileLocalizations.of(context)!.profileScreenTitle),
      ),
      body: RootContainer.roundedTop(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/profile_placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              currentUser!.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.gray900,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              currentUser.email,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
            ),
            const SizedBox(height: 20),
            const Divider(color: AppColors.gray50, thickness: 1, height: 0),
            SingleChildScrollView(
              child: Material(
                color: AppColors.transparent,
                child: Column(
                  children: [
                    ProfileMenuTile(
                      leadingIcon: AppIconsSvg.globe,
                      text: ProfileLocalizations.of(context)!.language,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SwitchLanguageScreen(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuTile(
                      leadingIcon: AppIconsSvg.messageChat,
                      text: ProfileLocalizations.of(context)!.help,
                      onTap: () {},
                    ),
                    ProfileMenuTile(
                      leadingIcon: AppIconsSvg.logout,
                      text: ProfileLocalizations.of(context)!.logout,
                      onTap: () {
                        ref.read(logoutProvider);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
