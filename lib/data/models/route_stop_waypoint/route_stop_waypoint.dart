import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';

part 'route_stop_waypoint.freezed.dart';
part 'route_stop_waypoint.g.dart';

@freezed
abstract class RouteStopWaypoint with _$RouteStopWaypoint {
  const factory RouteStopWaypoint({
    required int id,
    required IcarRoute? icarRoute,
    required IcarStop? icarStop,
    required int order,
  }) = _RouteStopWaypoint;

  factory RouteStopWaypoint.fromJson(Map<String, Object?> json) =>
      _$RouteStopWaypointFromJson(json);
}
