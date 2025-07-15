import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/features/home/viewmodels/closest_ticket_inqueue/closest_ticket_inqueue_viewmodel.dart';
import 'package:icar/ui/features/queue/viewmodels/my_queue/my_queue_viewmodel.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_details_viewmodel.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_review_viewmodel.dart';

void refreshTicketsState(Ref ref) {
  ref.invalidate(ticketListByStatusProvider(TicketStatus.IN_QUEUE));
  ref.invalidate(ticketListByStatusProvider(TicketStatus.FINISHED));
  ref.invalidate(ticketListByStatusProvider(TicketStatus.CANCELED));
  ref.invalidate(closestTicketInQueueProvider);
}

void refreshTicketById(Ref ref, int ticketId) {
  ref.invalidate(ticketDetailsProvider(ticketId));
  ref.invalidate(ticketHistoryProvider(ticketId));
}
