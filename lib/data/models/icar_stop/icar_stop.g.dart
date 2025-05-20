// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarStop _$IcarStopFromJson(Map<String, dynamic> json) => _IcarStop(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coordinate: _latLngFromJson(json['coordinate'] as Map<String, dynamic>),
  routeStopWaypoints:
      (json['routeStopWaypoints'] as List<dynamic>?)
          ?.map((e) => RouteStopWaypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
  schedules:
      (json['schedules'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
  distance: (json['distance'] as num?)?.toInt(),
  duration: _durationFromJson((json['duration'] as num?)?.toInt()),
);

Map<String, dynamic> _$IcarStopToJson(_IcarStop instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coordinate': _latLngToJson(instance.coordinate),
  'routeStopWaypoints': instance.routeStopWaypoints,
  'schedules': instance.schedules,
  'distance': instance.distance,
  'duration': _durationToJson(instance.duration),
};
