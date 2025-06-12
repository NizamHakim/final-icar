import 'package:flutter/material.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/ui/map/widgets/schedule_dialog/table/st_cell.dart';
import 'package:icar/ui/map/widgets/schedule_dialog/table/st_header.dart';

class StColumn extends StatelessWidget {
  const StColumn({super.key, required this.session, required this.schedules});

  final ScheduleSession session;
  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StHeader(session: session),
        for (final schedule in schedules) StCell(schedule: schedule),
      ],
    );
  }
}
