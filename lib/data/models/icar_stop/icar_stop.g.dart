// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarStop _$IcarStopFromJson(Map<String, dynamic> json) => _IcarStop(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coordinate: LatLng.fromJson(json['coordinate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IcarStopToJson(_IcarStop instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coordinate': instance.coordinate,
};
