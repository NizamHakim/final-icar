import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/schedule_repository/schedule_repository.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_list_viewmodel.g.dart';

@riverpod
Future<List<Schedule>> scheduleList(
  Ref ref, {
  required IcarStop icarStop,
  required IcarRoute icarRoute,
}) async {
  final scheduleRepository = ref.watch(scheduleRepositoryProvider);
  final scheduleEither = await scheduleRepository.getSchedulesByStopAndRoute(
    icarStop,
    icarRoute,
  );

  return scheduleEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (schedule) {
      return schedule;
    },
  );
}

@riverpod
class CreateNewTicket extends _$CreateNewTicket {
  @override
  FutureOr<Ticket?> build() {
    return null;
  }

  Future<void> createTicket(Schedule schedule) async {
    state = const AsyncValue.loading();

    final currentUser = ref.read(currentUserProvider);
    final ticketRepository = ref.read(ticketRepositoryProvider);

    final ticketEither = await ticketRepository.createNewTicket(
      currentUser!,
      schedule,
    );

    state = ticketEither.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (ticket) => AsyncValue.data(ticket),
    );
  }
}
