// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) =>
    _NotificationPayload(
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      ticketId: (json['ticketId'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationPayloadToJson(
  _NotificationPayload instance,
) => <String, dynamic>{
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'ticketId': instance.ticketId,
};

const _$NotificationTypeEnumMap = {
  NotificationType.TICKET_DETAILS: 'TICKET_DETAILS',
  NotificationType.TICKET_REVIEW: 'TICKET_REVIEW',
};
