// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/schedule/schedule.dart';

part 'icar.freezed.dart';
part 'icar.g.dart';

enum IcarStatus { ACTIVE, INACTIVE }

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

  factory Icar.fromJson(Map<String, Object?> json) => _$IcarFromJson(json);

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
