import 'package:flutter/material.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/data/models/schedule.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';
import 'package:icar/ui/queue/widgets/confirmation_dialog.dart';

class SlTile extends StatelessWidget {
  const SlTile({
    super.key,
    required this.schedule,
    required this.icarRoute,
    required this.icarStop,
  });

  final Schedule schedule;
  final IcarRoute icarRoute;
  final IcarStop icarStop;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          schedule.enabled
              ? TextBadge(
                text: Text(schedule.icar!.name),
                foregroundColor: AppColors.warning500,
                backgroundColor: AppColors.warning50,
                icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
              )
              : TextBadge(
                text: Text(schedule.icar!.name),
                foregroundColor: AppColors.gray300,
                backgroundColor: AppColors.gray50,
                icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
              ),
          const SizedBox(height: 4),
          Text(
            schedule.formattedTime,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.gray900,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          schedule.enabled
              ? Text(
                '${schedule.ticketCount} orang dalam antrean',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.success500),
              )
              : Text(
                'Antre dibuka 30 menit sebelum iCar tiba',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
              ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${schedule.icar!.capacity.toString()} kursi",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
          ),
        ],
      ),
      onTap:
          schedule.enabled
              ? () {
                showDialog(
                  context: context,
                  builder:
                      (context) => ConfirmationDialog(
                        schedule: schedule,
                        icarRoute: icarRoute,
                        icarStop: icarStop,
                      ),
                );
              }
              : null,
    );
  }
}
