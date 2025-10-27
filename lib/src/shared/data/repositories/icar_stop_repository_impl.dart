import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/shared/data/datasources/icar_stop_local_datasource.dart';
import 'package:icar/src/shared/data/datasources/icar_stop_remote_datasource.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/domain/repositories/icar_stop_repository.dart';

class IcarStopRepositoryImpl extends IcarStopRepository {
  final IcarStopRemoteDatasource _icarStopRemote;
  final IcarStopLocalDatasource _icarStopLocal;

  IcarStopRepositoryImpl(this._icarStopRemote, this._icarStopLocal);

  @override
  Future<Either<Failure, List<IcarStop>>> getStops(
    String token,
    Position userPosition,
  ) async {
    try {
      final result = await _icarStopRemote.getStops(token, userPosition);
      return Right(
        result.map((icarStopModel) => icarStopModel.toEntity()).toList(),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, IcarStop>> getStopById(
    String token,
    Position userPosition,
    int icarStopId,
  ) async {
    try {
      final result = await _icarStopRemote.getStopById(
        token,
        userPosition,
        icarStopId,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  List<int> getStopsHistory() {
    return _icarStopLocal.getStopsId();
  }

  @override
  void addStopToHistory(int stopId) {
    _icarStopLocal.addStopId(stopId);
  }
}
