import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_details_viewmodel.g.dart';

@riverpod
Future<Ticket> ticketDetails(Ref ref, {required Ticket ticket}) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketEither = await ticketRepository.getTicketDetails(ticket);

  return ticketEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (ticket) {
      return ticket;
    },
  );
}
