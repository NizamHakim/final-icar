import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/data/models/schedule.dart';
import 'package:icar/ui/core/app_colors.dart';
import 'package:icar/ui/core/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/queue/viewmodels/schedule_list_viewmodel.dart';

class ConfirmationDialog extends ConsumerWidget {
  const ConfirmationDialog({
    super.key,
    required this.schedule,
    required this.icarRoute,
    required this.icarStop,
  });

  final Schedule schedule;
  final IcarRoute icarRoute;
  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        'Konfirmasi antrean',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: SizedBox(
        width: screenWidth * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ConfirmationDialogTile(
              iconSvg: AppIconsSvg.busStop,
              text: "Halte ${icarStop.name}",
            ),
            _ConfirmationDialogTile(
              iconSvg: AppIconsSvg.route,
              text: icarRoute.name,
            ),
            _ConfirmationDialogTile(
              iconSvg: AppIconsSvg.clock,
              text: schedule.formattedTime,
            ),
            _ConfirmationDialogTile(
              iconSvg: AppIconsSvg.calendar,
              text: "Hari ini (${schedule.formattedDate})",
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref.watch(createNewTicketProvider(schedule: schedule));
            Navigator.of(context).pop();
          },
          child: Text(
            "Antre sekarang",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfirmationDialogTile extends StatelessWidget {
  const _ConfirmationDialogTile({required this.iconSvg, required this.text});

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
              Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray900),
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.gray100, thickness: 1),
      ],
    );
  }
}
