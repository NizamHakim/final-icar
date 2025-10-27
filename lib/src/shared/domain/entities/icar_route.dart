import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/route_stop_waypoint.dart';
import 'package:icar/src/utils/json_converter/color_json_converter.dart';
import 'package:icar/src/utils/json_converter/latlng_json_converter.dart';
import 'package:latlong2/latlong.dart';

part 'icar_route.freezed.dart';

@freezed
abstract class IcarRoute with _$IcarRoute {
  const IcarRoute._();

  const factory IcarRoute({
    required int id,
    required String name,
    @JsonKey(fromJson: colorFromJson, toJson: colorToJson) required Color color,
    List<Icar>? icars,
    List<RouteStopWaypoint>? routeStopWaypoints,
    @JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson)
    List<LatLng>? polylinePoints,
  }) = _IcarRoute;

  Color get secondaryColor => color.withValues(alpha: 0.1);
}
