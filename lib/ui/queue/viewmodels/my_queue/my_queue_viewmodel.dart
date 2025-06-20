import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_queue_viewmodel.g.dart';

@riverpod
Future<List<Ticket>> ticketListByStatus(Ref ref, TicketStatus status) async {
  final currentUser = ref.watch(currentUserProvider)!;
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketsEither = await ticketRepository.getTicketsByStatus(
    currentUser.id,
    status,
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
