// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDetailsNotification _$TicketDetailsNotificationFromJson(
  Map<String, dynamic> json,
) => TicketDetailsNotification(
  notificationType: json['notificationType'] as String,
  ticketId: (json['ticketId'] as num).toInt(),
);

Map<String, dynamic> _$TicketDetailsNotificationToJson(
  TicketDetailsNotification instance,
) => <String, dynamic>{
  'notificationType': instance.notificationType,
  'ticketId': instance.ticketId,
};

TicketReviewNotification _$TicketReviewNotificationFromJson(
  Map<String, dynamic> json,
) => TicketReviewNotification(
  notificationType: json['notificationType'] as String,
  ticketId: (json['ticketId'] as num).toInt(),
);

Map<String, dynamic> _$TicketReviewNotificationToJson(
  TicketReviewNotification instance,
) => <String, dynamic>{
  'notificationType': instance.notificationType,
  'ticketId': instance.ticketId,
};
