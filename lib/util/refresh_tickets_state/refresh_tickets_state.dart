import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/home/viewmodels/closest_ticket_inqueue/closest_ticket_inqueue_viewmodel.dart';
import 'package:icar/ui/queue/viewmodels/my_queue/my_queue_viewmodel.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_details_viewmodel.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_history_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'refresh_tickets_state.g.dart';

@riverpod
void refreshTicketsState(Ref ref) {
  ref.invalidate(ticketListByStatusProvider(TicketStatus.IN_QUEUE));
  ref.invalidate(ticketListByStatusProvider(TicketStatus.FINISHED));
  ref.invalidate(ticketListByStatusProvider(TicketStatus.CANCELED));
  ref.invalidate(closestTicketInQueueProvider);
}

@riverpod
void refreshTicketById(Ref ref, int ticketId) {
  ref.invalidate(ticketDetailsProvider(ticketId));
  ref.invalidate(ticketHistoryProvider(ticketId));
}
