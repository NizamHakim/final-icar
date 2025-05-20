// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Schedule _$ScheduleFromJson(Map<String, dynamic> json) => _Schedule(
  id: (json['id'] as num).toInt(),
  session: $enumDecode(_$ScheduleSessionEnumMap, json['session']),
  arrivalTime: DateTime.parse(json['arrivalTime'] as String),
  icarId: (json['icarId'] as num).toInt(),
  icarStopId: (json['icarStopId'] as num).toInt(),
  icar:
      json['icar'] == null
          ? null
          : Icar.fromJson(json['icar'] as Map<String, dynamic>),
  icarStop:
      json['icarStop'] == null
          ? null
          : IcarStop.fromJson(json['icarStop'] as Map<String, dynamic>),
  tickets:
      (json['tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ScheduleToJson(_Schedule instance) => <String, dynamic>{
  'id': instance.id,
  'session': _$ScheduleSessionEnumMap[instance.session]!,
  'arrivalTime': instance.arrivalTime.toIso8601String(),
  'icarId': instance.icarId,
  'icarStopId': instance.icarStopId,
  'icar': instance.icar,
  'icarStop': instance.icarStop,
  'tickets': instance.tickets,
};

const _$ScheduleSessionEnumMap = {
  ScheduleSession.SESSION_1: 'SESSION_1',
  ScheduleSession.SESSION_2: 'SESSION_2',
};
