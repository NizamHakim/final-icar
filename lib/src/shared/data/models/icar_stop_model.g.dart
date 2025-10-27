// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_stop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarStopModel _$IcarStopModelFromJson(Map<String, dynamic> json) =>
    _IcarStopModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coordinate: latLngFromJson(json['coordinate'] as Map<String, dynamic>),
      distance: (json['distance'] as num?)?.toInt(),
      routeStopWaypoints:
          (json['routeStopWaypoints'] as List<dynamic>?)
              ?.map(
                (e) =>
                    RouteStopWaypointModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      schedules:
          (json['schedules'] as List<dynamic>?)
              ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      duration: durationFromJson((json['duration'] as num?)?.toInt()),
    );

Map<String, dynamic> _$IcarStopModelToJson(_IcarStopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coordinate': latLngToJson(instance.coordinate),
      'distance': instance.distance,
      'routeStopWaypoints': instance.routeStopWaypoints,
      'schedules': instance.schedules,
      'duration': durationToJson(instance.duration),
    };
