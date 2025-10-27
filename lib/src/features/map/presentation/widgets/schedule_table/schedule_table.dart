import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_table/schedule_table_column.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';

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
            for (final entry in icar.schedulesBySession.entries)
              ScheduleTableColumn(session: entry.key, schedules: entry.value),
          ],
        ),
      ],
    );
  }
}
