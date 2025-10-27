import 'package:go_router/go_router.dart';
import 'package:icar/src/core/key/navigator_key.dart';
import 'package:icar/src/features/notification/domain/entities/notification_payload.dart';

void handleNotification(NotificationPayload payload) {
  switch (payload) {
    case TicketDetailsNotification():
      navigatorKey.currentContext?.go("/tickets/${payload.ticketId}");
      break;
    case TicketReviewNotification():
      // navigatorKey.currentState?.pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: (context) => TicketDetailsScreen(ticketId: payload.ticketId),
      //   ),
      //   (route) => route.isFirst,
      // );
      // showReviewSheet(navigatorKey.currentContext!, payload.ticketId);
      navigatorKey.currentContext?.go("/tickets/${payload.ticketId}/review");
      break;
  }
}
