import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'closest_ticket_inqueue_viewmodel.g.dart';

@riverpod
Future<Ticket?> closestTicketInQueue(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final closestTicketEither = await ticketRepository.getClosestTicket();

  return closestTicketEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (closestTicket) {
      return closestTicket;
    },
  );
}
