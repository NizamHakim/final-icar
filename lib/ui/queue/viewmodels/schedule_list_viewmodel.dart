import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/data/models/schedule.dart';
import 'package:icar/data/models/ticket.dart';
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
Future<Ticket> createNewTicket(Ref ref, {required Schedule schedule}) async {
  final currentUser = ref.watch(currentUserProvider);
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  final ticketEither = await ticketRepository.createNewTicket(
    currentUser!,
    schedule,
  );

  return ticketEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (ticket) {
      return ticket;
    },
  );
}
