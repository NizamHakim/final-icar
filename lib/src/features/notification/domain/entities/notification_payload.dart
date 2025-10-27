import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_payload.freezed.dart';
part 'notification_payload.g.dart';

@Freezed(unionKey: 'notificationType')
sealed class NotificationPayload with _$NotificationPayload {
  const factory NotificationPayload.ticketDetails({
    required String notificationType,
    required int ticketId,
  }) = TicketDetailsNotification;

  const factory NotificationPayload.ticketReview({
    required String notificationType,
    required int ticketId,
  }) = TicketReviewNotification;

  factory NotificationPayload.fromJson(Map<String, Object?> json) =>
      _$NotificationPayloadFromJson(json);
}
