import 'package:flutter/material.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/map/widgets/schedule_dialog/table/st_column.dart';

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
              StColumn(session: entry.key, schedules: entry.value),
          ],
        ),
      ],
    );
  }
}
