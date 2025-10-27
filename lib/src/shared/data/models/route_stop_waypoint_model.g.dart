// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop_waypoint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteStopWaypointModel _$RouteStopWaypointModelFromJson(
  Map<String, dynamic> json,
) => _RouteStopWaypointModel(
  id: (json['id'] as num).toInt(),
  icarRouteId: (json['icarRouteId'] as num).toInt(),
  icarStopId: (json['icarStopId'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  icarRoute:
      json['icarRoute'] == null
          ? null
          : IcarRouteModel.fromJson(json['icarRoute'] as Map<String, dynamic>),
  icarStop:
      json['icarStop'] == null
          ? null
          : IcarStopModel.fromJson(json['icarStop'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RouteStopWaypointModelToJson(
  _RouteStopWaypointModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'icarRouteId': instance.icarRouteId,
  'icarStopId': instance.icarStopId,
  'order': instance.order,
  'icarRoute': instance.icarRoute,
  'icarStop': instance.icarStop,
};
