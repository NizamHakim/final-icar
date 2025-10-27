// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarPositionModel _$IcarPositionModelFromJson(Map<String, dynamic> json) =>
    _IcarPositionModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      position: positionFromJson(json['position'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$IcarPositionModelToJson(_IcarPositionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': positionToJson(instance.position),
    };
