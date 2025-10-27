import 'package:icar/src/core/key/navigator_key.dart';

import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/repositories/ticket_repository.dart';
import 'package:icar/src/features/ticket/presentation/providers/refresh_tickets_state.dart';
import 'package:icar/src/l10n/generated/failure_localizations.dart';
import 'package:icar/src/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_ticket.g.dart';

@riverpod
class CreateTicket extends _$CreateTicket {
  late TicketRepository ticketRepository;
  late User currentUser;

  @override
  FutureOr<Ticket?> build() {
    currentUser = ref.watch(currentUserProvider).requireValue!;
    ticketRepository = ref.read(ticketRepositoryProvider);
    return null;
  }

  Future<void> createTicket(int scheduleId) async {
    state = const AsyncLoading();

    final ticketEither = await ticketRepository.createTicket(
      currentUser.token,
      scheduleId,
    );

    ticketEither.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (data) {
        final (ticket, message) = data;
        state = AsyncData(ticket);
        refreshTicketsState(ref);
        showSnackBar(
          navigatorKey.currentContext!,
          FailureLocalizations.of(
            navigatorKey.currentContext!,
          )!.failure(message),
        );
      },
    );
  }
}
