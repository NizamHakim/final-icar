import 'package:flutter/material.dart';
import 'package:icar/data/models/icar.dart';
import 'package:icar/data/models/schedule.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class ScheduleTable extends StatelessWidget {
  const ScheduleTable({super.key, required this.icar});

  final Icar icar;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColors.gray100, width: 1),
      children: [
        TableRow(
          children: [
            for (var entry in icar.schedulesBySession.entries)
              _ScheduleTableColumn(session: entry.key, schedules: entry.value),
          ],
        ),
      ],
    );
  }
}

class _ScheduleTableColumn extends StatelessWidget {
  const _ScheduleTableColumn({required this.session, required this.schedules});

  final String session;
  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ScheduleTableHeader(session: session),
        ...List.generate(
          schedules.length,
          (index) => _ScheduleTableCell(
            enabled: true,
            timeString: schedules[index].formattedTime,
          ),
        ),
      ],
    );
  }
}

class _ScheduleTableHeader extends StatelessWidget {
  const _ScheduleTableHeader({required this.session});

  final String session;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray100, width: 1)),
        color: AppColors.gray50,
      ),
      child: Center(
        child: Text(
          session,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray700),
        ),
      ),
    );
  }
}

class _ScheduleTableCell extends StatelessWidget {
  const _ScheduleTableCell({required this.enabled, required this.timeString});

  final bool enabled;
  final String timeString;

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
          timeString,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: enabled ? AppColors.gray700 : AppColors.gray200,
          ),
        ),
      ),
    );
  }
}
