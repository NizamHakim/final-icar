// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarRoute _$IcarRouteFromJson(Map<String, dynamic> json) => _IcarRoute(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  color: _colorFromJson(json['hexColor'] as String),
  polylinePoints:
      (json['polylinePoints'] as List<dynamic>?)
          ?.map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$IcarRouteToJson(_IcarRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hexColor': _colorToJson(instance.color),
      'polylinePoints': instance.polylinePoints,
    };
