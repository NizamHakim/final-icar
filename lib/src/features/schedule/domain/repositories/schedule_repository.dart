import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:icar/src/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_repository.g.dart';

@riverpod
ScheduleRepository scheduleRepository(Ref ref) {
  final scheduleRemoteDatasource = ref.watch(scheduleRemoteDatasourceProvider);
  return ScheduleRepositoryImpl(scheduleRemoteDatasource);
}

abstract class ScheduleRepository {
  Future<Either<Failure, List<Schedule>>> getSchedulesByStopAndRoute(
    String token,
    int icarStopId,
    int icarRouteId,
  );
}
