import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/remote/ticket_repository.dart';
import 'package:icar/util/refresh_tickets_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_details_viewmodel.g.dart';

@riverpod
Future<Ticket> ticketDetails(Ref ref, int ticketId) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketEither = await ticketRepository.getTicketDetails(ticketId);

  return ticketEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (ticket) {
      return ticket;
    },
  );
}

@riverpod
class CancelTicket extends _$CancelTicket {
  @override
  FutureOr<Ticket?> build() {
    return null;
  }

  Future<void> cancelTicket(int ticketId) async {
    state = const AsyncValue.loading();
    final ticketRepository = ref.read(ticketRepositoryProvider);
    final cancelResult = await ticketRepository.cancelTicket(ticketId);

    cancelResult.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (ticket) {
        state = AsyncValue.data(ticket);
        refreshTicketById(ref, ticket.id);
        refreshTicketsState(ref);
      },
    );
  }
}
