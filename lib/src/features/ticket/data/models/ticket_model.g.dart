// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => _TicketModel(
  id: (json['id'] as num).toInt(),
  arrivedAt: DateTime.parse(json['arrivedAt'] as String),
  expiredAt: DateTime.parse(json['expiredAt'] as String),
  status: $enumDecode(_$TicketStatusEnumMap, json['status']),
  userId: (json['userId'] as num).toInt(),
  scheduleId: (json['scheduleId'] as num).toInt(),
  user:
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  schedule:
      json['schedule'] == null
          ? null
          : ScheduleModel.fromJson(json['schedule'] as Map<String, dynamic>),
  review:
      json['review'] == null
          ? null
          : ReviewModel.fromJson(json['review'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TicketModelToJson(_TicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'arrivedAt': instance.arrivedAt.toIso8601String(),
      'expiredAt': instance.expiredAt.toIso8601String(),
      'status': _$TicketStatusEnumMap[instance.status]!,
      'userId': instance.userId,
      'scheduleId': instance.scheduleId,
      'user': instance.user,
      'schedule': instance.schedule,
      'review': instance.review,
    };

const _$TicketStatusEnumMap = {
  TicketStatus.IN_QUEUE: 'IN_QUEUE',
  TicketStatus.CANCELED: 'CANCELED',
  TicketStatus.FINISHED: 'FINISHED',
};
