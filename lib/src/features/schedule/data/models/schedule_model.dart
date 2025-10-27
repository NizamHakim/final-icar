import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/shared/data/models/icar_model.dart';
import 'package:icar/src/shared/data/models/icar_stop_model.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
abstract class ScheduleModel with _$ScheduleModel {
  const ScheduleModel._();

  const factory ScheduleModel({
    required int id,
    required ScheduleSession session,
    required DateTime arrivalTime,
    required int icarId,
    required int icarStopId,
    IcarModel? icar,
    IcarStopModel? icarStop,
    int? ticketCount,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, Object?> json) =>
      _$ScheduleModelFromJson(json);

  Schedule toEntity() {
    return Schedule(
      id: id,
      session: session,
      arrivalTime: arrivalTime,
      icarId: icarId,
      icarStopId: icarStopId,
      icar: icar?.toEntity(),
      icarStop: icarStop?.toEntity(),
      ticketCount: ticketCount,
    );
  }
}
