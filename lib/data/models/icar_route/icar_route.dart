import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/json_converter/color_json_converter.dart';
import 'package:icar/data/models/route_stop_waypoint/route_stop_waypoint.dart';
import 'package:latlong2/latlong.dart';

part 'icar_route.freezed.dart';
part 'icar_route.g.dart';

@freezed
abstract class IcarRoute with _$IcarRoute {
  const IcarRoute._();

  const factory IcarRoute({
    required int id,
    required String name,
    @JsonKey(fromJson: colorFromJson, toJson: colorToJson) required Color color,
    List<Icar>? icars,
    List<RouteStopWaypoint>? routeStopWaypoints,
    @JsonKey(fromJson: _latLngFromJson, toJson: _latLngToJson)
    List<LatLng>? polylinePoints,
  }) = _IcarRoute;

  factory IcarRoute.fromJson(Map<String, Object?> json) =>
      _$IcarRouteFromJson(json);

  Color get secondaryColor => color.withValues(alpha: 0.1);
}

List<LatLng>? _latLngFromJson(List<dynamic>? latLngList) {
  if (latLngList == null) return null;
  return latLngList.map((latLng) {
    latLng = latLng as Map<String, dynamic>;
    return LatLng(latLng['latitude'] as double, latLng['longitude'] as double);
  }).toList();
}

List<Map<String, double>>? _latLngToJson(List<LatLng>? latLngList) {
  if (latLngList == null) return null;
  return latLngList
      .map(
        (latLng) => {
          'latitude': latLng.latitude,
          'longitude': latLng.longitude,
        },
      )
      .toList();
}
