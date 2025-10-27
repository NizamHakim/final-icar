import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_status.dart';

part 'icar.freezed.dart';

@freezed
abstract class Icar with _$Icar {
  const Icar._();

  const factory Icar({
    required int id,
    required String name,
    required int capacity,
    required IcarStatus status,
    required int icarRouteId,
    IcarRoute? icarRoute,
    List<Schedule>? schedules,
  }) = _Icar;

  Map<ScheduleSession, List<Schedule>> get schedulesBySession {
    final Map<ScheduleSession, List<Schedule>> schedulesBySession = {};
    if (schedules != null) {
      for (var schedule in schedules!) {
        final session = schedule.session;
        if (!schedulesBySession.containsKey(session)) {
          schedulesBySession[session] = [];
        }
        schedulesBySession[session]!.add(schedule);
      }
    }
    return schedulesBySession;
  }
}
