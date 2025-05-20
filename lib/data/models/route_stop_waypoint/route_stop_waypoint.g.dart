// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop_waypoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteStopWaypoint _$RouteStopWaypointFromJson(Map<String, dynamic> json) =>
    _RouteStopWaypoint(
      id: (json['id'] as num).toInt(),
      icarRoute:
          json['icarRoute'] == null
              ? null
              : IcarRoute.fromJson(json['icarRoute'] as Map<String, dynamic>),
      icarStop:
          json['icarStop'] == null
              ? null
              : IcarStop.fromJson(json['icarStop'] as Map<String, dynamic>),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$RouteStopWaypointToJson(_RouteStopWaypoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icarRoute': instance.icarRoute,
      'icarStop': instance.icarStop,
      'order': instance.order,
    };
