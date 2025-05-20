import 'package:flutter/material.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';

class SdHeader extends StatelessWidget {
  const SdHeader({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halte ${icarStop.name}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "${icarStop.distance}m",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "•",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const AppIcon(
                      iconSvg: AppIconsSvg.walk,
                      size: 20,
                      color: AppColors.gray400,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${icarStop.duration!.inMinutes} menit",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextBadge(
            text: Text(
              "Berhenti 1 menit",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            foregroundColor: AppColors.primary500,
            backgroundColor: AppColors.primary50,
            icon: const AppIcon(iconSvg: AppIconsSvg.infoCircle, size: 14),
          ),
        ],
      ),
    );
  }
}
