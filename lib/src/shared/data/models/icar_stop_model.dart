import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/schedule/data/models/schedule_model.dart';
import 'package:icar/src/shared/data/models/route_stop_waypoint_model.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/utils/json_converter/duration_json_converter.dart';
import 'package:icar/src/utils/json_converter/latlng_json_converter.dart';
import 'package:latlong2/latlong.dart';

part 'icar_stop_model.freezed.dart';
part 'icar_stop_model.g.dart';

@freezed
abstract class IcarStopModel with _$IcarStopModel {
  const IcarStopModel._();

  const factory IcarStopModel({
    required int id,
    required String name,
    @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
    required LatLng coordinate,
    // optional
    int? distance,
    List<RouteStopWaypointModel>? routeStopWaypoints,
    List<ScheduleModel>? schedules,
    @JsonKey(fromJson: durationFromJson, toJson: durationToJson)
    Duration? duration,
  }) = _IcarStopModel;

  factory IcarStopModel.fromJson(Map<String, Object?> json) =>
      _$IcarStopModelFromJson(json);

  IcarStop toEntity() {
    return IcarStop(
      id: id,
      name: name,
      coordinate: coordinate,
      distance: distance,
      routeStopWaypoints:
          routeStopWaypoints?.map((rsw) => rsw.toEntity()).toList(),
      schedules: schedules?.map((schedule) => schedule.toEntity()).toList(),
      duration: duration,
    );
  }
}
