// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarRoute _$IcarRouteFromJson(Map<String, dynamic> json) => _IcarRoute(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  color: colorFromJson(json['color'] as String),
  icars:
      (json['icars'] as List<dynamic>?)
          ?.map((e) => Icar.fromJson(e as Map<String, dynamic>))
          .toList(),
  routeStopWaypoints:
      (json['routeStopWaypoints'] as List<dynamic>?)
          ?.map((e) => RouteStopWaypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
  polylinePoints: _latLngFromJson(json['polylinePoints'] as List?),
);

Map<String, dynamic> _$IcarRouteToJson(_IcarRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': colorToJson(instance.color),
      'icars': instance.icars,
      'routeStopWaypoints': instance.routeStopWaypoints,
      'polylinePoints': _latLngToJson(instance.polylinePoints),
    };
