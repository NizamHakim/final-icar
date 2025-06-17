import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/core/providers/user_location/user_location.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_remote_repository.dart';
import 'package:icar/data/repositories/schedule_repository/schedule_repository.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_list_viewmodel.g.dart';

@riverpod
Future<IcarStop> icarStop(Ref ref, int icarStopId) async {
  final stopRepository = ref.watch(icarStopRemoteRepositoryProvider);
  final userPosition = await ref.watch(userLocationProvider.future);
  final stopEither = await stopRepository.getStopById(icarStopId, userPosition);

  return stopEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (stop) {
      return stop;
    },
  );
}

@riverpod
Future<IcarRoute> icarRoute(Ref ref, int icarRouteId) async {
  final routeRepository = ref.watch(icarRouteRepositoryProvider);
  final routeEither = await routeRepository.getRouteById(icarRouteId);

  return routeEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (route) {
      return route;
    },
  );
}

@riverpod
Future<List<Schedule>> scheduleList(
  Ref ref, {
  required int icarStopId,
  required int icarRouteId,
}) async {
  final scheduleRepository = ref.watch(scheduleRepositoryProvider);
  final scheduleEither = await scheduleRepository.getSchedulesByStopAndRoute(
    icarStopId,
    icarRouteId,
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

  Future<void> createTicket(int scheduleId) async {
    state = const AsyncValue.loading();

    final currentUser = ref.read(currentUserProvider)!;
    final ticketRepository = ref.read(ticketRepositoryProvider);

    final ticketEither = await ticketRepository.createNewTicket(
      currentUser.id,
      scheduleId,
    );

    state = ticketEither.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (ticket) => AsyncValue.data(ticket),
    );
  }
}
