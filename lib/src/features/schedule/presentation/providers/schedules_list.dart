import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_status.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedules_list.g.dart';

@riverpod
Future<List<Schedule>> schedulesList(
  Ref ref, {
  required int icarStopId,
  required int icarRouteId,
}) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final scheduleRepository = ref.watch(scheduleRepositoryProvider);
  final scheduleEither = await scheduleRepository.getSchedulesByStopAndRoute(
    currentUser.token,
    icarStopId,
    icarRouteId,
  );

  return scheduleEither.fold(
    (failure) {
      throw failure;
    },
    (schedule) {
      return schedule;
    },
  );
}

final fakeSchedules = List.generate(
  6,
  (index) => Schedule(
    id: 0,
    session: ScheduleSession.SESSION_1,
    arrivalTime: DateTime.now(),
    icarId: 0,
    icarStopId: 0,
    ticketCount: 0,
    icar: const Icar(
      id: 0,
      name: "Dummy Icar",
      capacity: 0,
      status: IcarStatus.ACTIVE,
      icarRouteId: 0,
      icarRoute: IcarRoute(id: 0, name: "Dummy Route", color: Colors.black),
    ),
    icarStop: const IcarStop(
      id: 0,
      name: "Dummy Stop",
      coordinate: LatLng(0, 0),
    ),
  ),
);
