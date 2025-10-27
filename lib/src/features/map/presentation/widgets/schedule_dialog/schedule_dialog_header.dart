import 'package:flutter/material.dart';
import 'package:icar/src/l10n/generated/map_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/shared/presentation/widgets/text_badge.dart';

class ScheduleDialogHeader extends StatelessWidget {
  const ScheduleDialogHeader({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  SharedLocalizations.of(context)!.stopWithName(icarStop.name),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
              ),
              TextBadge(
                text: Text(
                  MapLocalizations.of(context)!.stopsForOneMinute,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                foregroundColor: AppColors.primary500,
                backgroundColor: AppColors.primary50,
                icon: const AppIcon(iconSvg: AppIconsSvg.infoCircle, size: 14),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                "${icarStop.distance}m",
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
                SharedLocalizations.of(
                  context,
                )!.minutes(icarStop.duration!.inMinutes),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
