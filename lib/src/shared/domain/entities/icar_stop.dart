import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/shared/domain/entities/route_stop_waypoint.dart';
import 'package:latlong2/latlong.dart';

part 'icar_stop.freezed.dart';

@freezed
abstract class IcarStop with _$IcarStop {
  const factory IcarStop({
    required int id,
    required String name,
    required LatLng coordinate,
    int? distance,
    List<RouteStopWaypoint>? routeStopWaypoints,
    List<Schedule>? schedules,
    Duration? duration,
  }) = _IcarStop;
}
