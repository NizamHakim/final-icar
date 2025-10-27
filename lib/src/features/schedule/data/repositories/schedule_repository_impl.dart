import 'package:fpdart/fpdart.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleRemoteDatasource _scheduleRemote;

  ScheduleRepositoryImpl(this._scheduleRemote);

  @override
  Future<Either<Failure, List<Schedule>>> getSchedulesByStopAndRoute(
    String token,
    int icarStopId,
    int icarRouteId,
  ) async {
    try {
      final result = await _scheduleRemote.getSchedules(
        token,
        icarStopId: icarStopId,
        icarRouteId: icarRouteId,
      );
      return Right(
        result.map((scheduleModel) => scheduleModel.toEntity()).toList(),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
