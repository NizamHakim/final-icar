import 'package:flutter/material.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';

class CdTile extends StatelessWidget {
  const CdTile({super.key, required this.iconSvg, required this.text});

  final AppIconsSvg iconSvg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              AppIcon(iconSvg: iconSvg, color: AppColors.primary600, size: 16),
              const SizedBox(width: 8),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.55,
                ),
                child: Text(
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.gray900),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.gray100, thickness: 1),
      ],
    );
  }
}
