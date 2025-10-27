import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/utils/extension/datetime_extension.dart';

class ScheduleTableCell extends ConsumerWidget {
  const ScheduleTableCell({super.key, required this.schedule});

  final Schedule schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray100, width: 1)),
        color: AppColors.white,
      ),
      child: Center(
        child: Text(
          schedule.arrivalTime.timeHM(currentLocale),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            // ignore: dead_code
            color: true ? AppColors.gray700 : AppColors.gray200,
          ),
        ),
      ),
    );
  }
}
