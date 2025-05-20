import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_queue_viewmodel.g.dart';

@riverpod
Future<List<Ticket>> inQueueTickets(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketsEither = await ticketRepository.getTicketsByStatus(
    TicketStatus.inQueue,
  );

  return ticketsEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (tickets) {
      return tickets;
    },
  );
}

@riverpod
Future<List<Ticket>> canceledTickets(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketsEither = await ticketRepository.getTicketsByStatus(
    TicketStatus.canceled,
  );

  return ticketsEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (tickets) {
      return tickets;
    },
  );
}

@riverpod
Future<List<Ticket>> finishedTickets(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketsEither = await ticketRepository.getTicketsByStatus(
    TicketStatus.finished,
  );

  return ticketsEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (tickets) {
      return tickets;
    },
  );
}
