// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarRouteModel _$IcarRouteModelFromJson(Map<String, dynamic> json) =>
    _IcarRouteModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: colorFromJson(json['color'] as String),
      icars:
          (json['icars'] as List<dynamic>?)
              ?.map((e) => IcarModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      routeStopWaypoints:
          (json['routeStopWaypoints'] as List<dynamic>?)
              ?.map(
                (e) =>
                    RouteStopWaypointModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      polylinePoints: listLatLngFromJson(json['polylinePoints'] as List?),
    );

Map<String, dynamic> _$IcarRouteModelToJson(_IcarRouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': colorToJson(instance.color),
      'icars': instance.icars,
      'routeStopWaypoints': instance.routeStopWaypoints,
      'polylinePoints': listLatLngToJson(instance.polylinePoints),
    };
