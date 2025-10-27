import 'package:fpdart/fpdart.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/shared/data/datasources/icar_route_remote_datasource.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/repositories/icar_route_repository.dart';

class IcarRouteRepositoryImpl extends IcarRouteRepository {
  final IcarRouteRemoteDatasource _icarRouteRemote;

  IcarRouteRepositoryImpl(this._icarRouteRemote);

  @override
  Future<Either<Failure, List<IcarRoute>>> getRoutes(
    String token,
    bool polyline,
  ) async {
    try {
      final result = await _icarRouteRemote.getRoutes(
        token,
        polyline: polyline,
      );
      return Right(
        result.map((icarRouteModel) => icarRouteModel.toEntity()).toList(),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, IcarRoute>> getRouteById(
    String token,
    int icarRouteId,
  ) async {
    try {
      final result = await _icarRouteRemote.getRouteById(token, icarRouteId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
