// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/json_converter/latlng_json_converter.dart';
import 'package:icar/data/models/route_stop_waypoint/route_stop_waypoint.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:latlong2/latlong.dart';

part 'icar_stop.freezed.dart';
part 'icar_stop.g.dart';

@freezed
abstract class IcarStop with _$IcarStop {
  const factory IcarStop({
    required int id,
    required String name,
    @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
    required LatLng coordinate,
    List<RouteStopWaypoint>? routeStopWaypoints,
    List<Schedule>? schedules,
    int? distance,
    @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
    Duration? duration,
  }) = _IcarStop;

  factory IcarStop.fromJson(Map<String, Object?> json) =>
      _$IcarStopFromJson(json);
}

Duration? _durationFromJson(int? seconds) {
  if (seconds == null) return null;
  return Duration(seconds: seconds);
}

int? _durationToJson(Duration? duration) {
  if (duration == null) return null;
  return duration.inSeconds;
}
