import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.onTap,
  });

  final AppIconsSvg leadingIcon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: AppIcon(iconSvg: leadingIcon, color: AppColors.gray900),
          title: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const AppIcon(
            iconSvg: AppIconsSvg.chevronRight,
            color: AppColors.gray500,
          ),
        ),
        const Divider(color: AppColors.gray50, thickness: 1, height: 0),
      ],
    );
  }
}
