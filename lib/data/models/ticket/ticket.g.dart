// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ticket _$TicketFromJson(Map<String, dynamic> json) => _Ticket(
  id: (json['id'] as num).toInt(),
  expiredAt: DateTime.parse(json['expiredAt'] as String),
  status: $enumDecode(_$TicketStatusEnumMap, json['status']),
  userId: (json['userId'] as num).toInt(),
  scheduleId: (json['scheduleId'] as num).toInt(),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  schedule:
      json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TicketToJson(_Ticket instance) => <String, dynamic>{
  'id': instance.id,
  'expiredAt': instance.expiredAt.toIso8601String(),
  'status': _$TicketStatusEnumMap[instance.status]!,
  'userId': instance.userId,
  'scheduleId': instance.scheduleId,
  'user': instance.user,
  'schedule': instance.schedule,
};

const _$TicketStatusEnumMap = {
  TicketStatus.IN_QUEUE: 'IN_QUEUE',
  TicketStatus.CANCELED: 'CANCELED',
  TicketStatus.FINISHED: 'FINISHED',
};
