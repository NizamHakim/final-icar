import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/remote/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_queue_viewmodel.g.dart';

@riverpod
Future<List<Ticket>> ticketListByStatus(Ref ref, TicketStatus status) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketsEither = await ticketRepository.getTicketsByStatus(status);

  return ticketsEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (tickets) {
      return tickets;
    },
  );
}
