import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';

class LatestSearch extends ConsumerWidget {
  const LatestSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pencarian terbaru",
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray500),
        ),
        const SizedBox(height: 14),
        ...List.generate(
          3,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Halte ${index + 1}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray900,
                ),
              ),
              Row(
                children: [
                  Text(
                    "200m",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "•",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
                  ),
                  const SizedBox(width: 8),
                  const AppIcon(
                    iconSvg: AppIconsSvg.walk,
                    size: 20,
                    color: AppColors.gray400,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "3 menit",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
                  ),
                ],
              ),
              const Divider(color: AppColors.gray50, thickness: 1),
            ],
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
