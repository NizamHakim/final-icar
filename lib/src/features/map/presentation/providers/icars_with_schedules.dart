import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_status.dart';
import 'package:icar/src/shared/domain/repositories/icar_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icars_with_schedules.g.dart';

@riverpod
Future<List<Icar>> icarsWithSchedules(Ref ref, int icarStopId) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final icarRepository = ref.watch(icarRepositoryProvider);
  final icarsEither = await icarRepository.getIcarsWithSchedulesByStopId(
    currentUser.token,
    icarStopId,
  );

  return icarsEither.fold(
    (failure) {
      throw failure;
    },
    (icars) {
      return icars;
    },
  );
}

final fakeIcarsWithSchedules = [
  Icar(
    id: 0,
    name: "Dummy Icar",
    capacity: 0,
    status: IcarStatus.ACTIVE,
    icarRouteId: 0,
    icarRoute: const IcarRoute(id: 0, name: "Dummy Route", color: Colors.black),
    schedules: List.generate(
      10,
      (index) => Schedule(
        id: 0,
        session:
            (index < 5) ? ScheduleSession.SESSION_1 : ScheduleSession.SESSION_2,
        arrivalTime: DateTime.now(),
        icarId: 0,
        icarStopId: 0,
      ),
    ),
  ),
];
