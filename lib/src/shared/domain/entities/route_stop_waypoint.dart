import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';

part 'route_stop_waypoint.freezed.dart';

@freezed
abstract class RouteStopWaypoint with _$RouteStopWaypoint {
  const factory RouteStopWaypoint({
    required int id,
    required int icarRouteId,
    required int icarStopId,
    required int order,
    IcarRoute? icarRoute,
    IcarStop? icarStop,
  }) = _RouteStopWaypoint;
}
