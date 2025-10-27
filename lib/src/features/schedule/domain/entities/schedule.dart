import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';

part 'schedule.freezed.dart';

@freezed
abstract class Schedule with _$Schedule {
  const Schedule._();

  const factory Schedule({
    required int id,
    required ScheduleSession session,
    required DateTime arrivalTime,
    required int icarId,
    required int icarStopId,
    Icar? icar,
    IcarStop? icarStop,
    int? ticketCount,
  }) = _Schedule;

  bool get isEnabled {
    return arrivalTime.isBefore(
      DateTime.now().add(const Duration(minutes: 30)),
    );
  }
}
