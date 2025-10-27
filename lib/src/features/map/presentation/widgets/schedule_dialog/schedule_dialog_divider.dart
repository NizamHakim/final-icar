import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:icar/src/l10n/generated/map_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class ScheduleDialogDivider extends StatelessWidget {
  const ScheduleDialogDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DottedLine(
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 6,
          dashColor: AppColors.gray100,
          dashGapLength: 6,
        ),
        Container(
          width: double.infinity,
          height: 34,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: const BoxDecoration(color: AppColors.gray50),
          child: Text(
            MapLocalizations.of(context)!.arrivalTime,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.gray700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const DottedLine(
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 6,
          dashColor: AppColors.gray100,
          dashGapLength: 6,
        ),
      ],
    );
  }
}
