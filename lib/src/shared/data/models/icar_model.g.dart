// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IcarModel _$IcarModelFromJson(Map<String, dynamic> json) => _IcarModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  capacity: (json['capacity'] as num).toInt(),
  status: $enumDecode(_$IcarStatusEnumMap, json['status']),
  icarRouteId: (json['icarRouteId'] as num).toInt(),
  icarRoute:
      json['icarRoute'] == null
          ? null
          : IcarRouteModel.fromJson(json['icarRoute'] as Map<String, dynamic>),
  schedules:
      (json['schedules'] as List<dynamic>?)
          ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$IcarModelToJson(_IcarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capacity': instance.capacity,
      'status': _$IcarStatusEnumMap[instance.status]!,
      'icarRouteId': instance.icarRouteId,
      'icarRoute': instance.icarRoute,
      'schedules': instance.schedules,
    };

const _$IcarStatusEnumMap = {
  IcarStatus.ACTIVE: 'ACTIVE',
  IcarStatus.INACTIVE: 'INACTIVE',
};
