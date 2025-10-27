import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/schedule/data/models/schedule_model.dart';
import 'package:icar/src/shared/data/models/icar_route_model.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_status.dart';

part 'icar_model.freezed.dart';
part 'icar_model.g.dart';

@freezed
abstract class IcarModel with _$IcarModel {
  const IcarModel._();

  const factory IcarModel({
    required int id,
    required String name,
    required int capacity,
    required IcarStatus status,
    required int icarRouteId,
    IcarRouteModel? icarRoute,
    List<ScheduleModel>? schedules,
  }) = _IcarModel;

  factory IcarModel.fromJson(Map<String, Object?> json) =>
      _$IcarModelFromJson(json);

  Icar toEntity() {
    return Icar(
      id: id,
      name: name,
      capacity: capacity,
      status: status,
      icarRouteId: icarRouteId,
      icarRoute: icarRoute?.toEntity(),
      schedules: schedules?.map((schedule) => schedule.toEntity()).toList(),
    );
  }
}
