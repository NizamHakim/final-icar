import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_details_viewmodel.g.dart';

@riverpod
Future<Ticket> ticketDetails(Ref ref, int ticketId) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketEither = await ticketRepository.getTicketDetails(ticketId);

  return ticketEither.fold(
    (error) {
      throw Exception(error.message);
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
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
      (success) {
        state = AsyncValue.data(success);
      },
    );
  }
}
