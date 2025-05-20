// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Icar _$IcarFromJson(Map<String, dynamic> json) => _Icar(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  capacity: (json['capacity'] as num).toInt(),
  status: $enumDecode(_$IcarStatusEnumMap, json['status']),
  route:
      json['route'] == null
          ? null
          : IcarRoute.fromJson(json['route'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IcarToJson(_Icar instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'capacity': instance.capacity,
  'status': _$IcarStatusEnumMap[instance.status]!,
  'route': instance.route,
};

const _$IcarStatusEnumMap = {
  IcarStatus.ACTIVE: 'ACTIVE',
  IcarStatus.INACTIVE: 'INACTIVE',
};
