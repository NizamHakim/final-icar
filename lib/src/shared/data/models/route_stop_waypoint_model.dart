import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/data/models/icar_route_model.dart';
import 'package:icar/src/shared/data/models/icar_stop_model.dart';
import 'package:icar/src/shared/domain/entities/route_stop_waypoint.dart';

part 'route_stop_waypoint_model.freezed.dart';
part 'route_stop_waypoint_model.g.dart';

@freezed
abstract class RouteStopWaypointModel with _$RouteStopWaypointModel {
  const RouteStopWaypointModel._();

  const factory RouteStopWaypointModel({
    required int id,
    required int icarRouteId,
    required int icarStopId,
    required int order,
    // optional
    IcarRouteModel? icarRoute,
    IcarStopModel? icarStop,
  }) = _RouteStopWaypointModel;

  factory RouteStopWaypointModel.fromJson(Map<String, Object?> json) =>
      _$RouteStopWaypointModelFromJson(json);

  RouteStopWaypoint toEntity() {
    return RouteStopWaypoint(
      id: id,
      icarRouteId: icarRouteId,
      icarStopId: icarStopId,
      order: order,
      icarRoute: icarRoute?.toEntity(),
      icarStop: icarStop?.toEntity(),
    );
  }
}
