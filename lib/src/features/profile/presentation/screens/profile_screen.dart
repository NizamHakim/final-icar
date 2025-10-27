import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/profile/presentation/providers/call_help.dart';
import 'package:icar/src/l10n/generated/profile_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:icar/src/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider).requireValue;

    return Scaffold(
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
            Skeletonizer(
              enabled: currentUser == null,
              child: Text(
                currentUser?.name ?? BoneMock.fullName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.gray900,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Skeletonizer(
              enabled: currentUser == null,
              child: Text(
                currentUser?.email ?? BoneMock.email,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
              ),
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
                      onTap: () => context.go("/profile/language"),
                    ),
                    ProfileMenuTile(
                      leadingIcon: AppIconsSvg.messageChat,
                      text: ProfileLocalizations.of(context)!.help,
                      onTap: callHelp,
                    ),
                    ProfileMenuTile(
                      leadingIcon: AppIconsSvg.logout,
                      text: ProfileLocalizations.of(context)!.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const LogoutDialog(),
                        );
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
