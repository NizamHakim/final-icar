import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/data/models/icar_model.dart';
import 'package:icar/src/shared/data/models/route_stop_waypoint_model.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/utils/json_converter/color_json_converter.dart';
import 'package:icar/src/utils/json_converter/latlng_json_converter.dart';
import 'package:latlong2/latlong.dart';

part 'icar_route_model.freezed.dart';
part 'icar_route_model.g.dart';

@freezed
abstract class IcarRouteModel with _$IcarRouteModel {
  const IcarRouteModel._();

  const factory IcarRouteModel({
    required int id,
    required String name,
    // optional
    @JsonKey(fromJson: colorFromJson, toJson: colorToJson) required Color color,
    List<IcarModel>? icars,
    List<RouteStopWaypointModel>? routeStopWaypoints,
    @JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson)
    List<LatLng>? polylinePoints,
  }) = _IcarRouteModel;

  factory IcarRouteModel.fromJson(Map<String, Object?> json) =>
      _$IcarRouteModelFromJson(json);

  IcarRoute toEntity() {
    return IcarRoute(
      id: id,
      name: name,
      color: color,
      icars: icars?.map((icar) => icar.toEntity()).toList(),
      routeStopWaypoints:
          routeStopWaypoints?.map((rsw) => rsw.toEntity()).toList(),
      polylinePoints: polylinePoints,
    );
  }
}
