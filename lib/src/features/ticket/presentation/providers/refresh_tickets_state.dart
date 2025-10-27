import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/presentation/providers/closest_ticket.dart';
import 'package:icar/src/features/ticket/presentation/providers/ticket_details.dart';
import 'package:icar/src/features/ticket/presentation/providers/tickets_by_status.dart';

void refreshTicketsState(Ref ref) {
  ref.invalidate(ticketsByStatusProvider);
  ref.invalidate(closestTicketProvider);
}

void refreshTicketById(Ref ref, int ticketId) {
  ref.invalidate(ticketDetailsProvider(ticketId));
}
