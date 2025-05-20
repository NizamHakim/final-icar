import 'package:flutter/material.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class StCell extends StatelessWidget {
  const StCell({super.key, required this.schedule});

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray100, width: 1)),
        color: AppColors.white,
      ),
      child: Center(
        child: Text(
          schedule.formattedArrivalTime,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            // ignore: dead_code
            color: true ? AppColors.gray700 : AppColors.gray200,
          ),
        ),
      ),
    );
  }
}
