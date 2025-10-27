import 'package:flutter/material.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_table/schedule_table_cell.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_table/schedule_table_header.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';

class ScheduleTableColumn extends StatelessWidget {
  const ScheduleTableColumn({
    super.key,
    required this.session,
    required this.schedules,
  });

  final ScheduleSession session;
  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScheduleTableHeader(session: session),
        for (final schedule in schedules) ScheduleTableCell(schedule: schedule),
      ],
    );
  }
}
