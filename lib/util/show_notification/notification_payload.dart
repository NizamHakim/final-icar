// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_payload.freezed.dart';
part 'notification_payload.g.dart';

enum NotificationType { TICKET_DETAILS, TICKET_REVIEW }

@freezed
abstract class NotificationPayload with _$NotificationPayload {
  const NotificationPayload._();
  const factory NotificationPayload({
    required NotificationType type,
    required int ticketId,
  }) = _NotificationPayload;

  factory NotificationPayload.fromJson(Map<String, Object?> json) =>
      _$NotificationPayloadFromJson(json);
}
