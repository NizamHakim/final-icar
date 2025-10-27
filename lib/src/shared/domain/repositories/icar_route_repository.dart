import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/shared/data/datasources/icar_route_remote_datasource.dart';
import 'package:icar/src/shared/data/repositories/icar_route_repository_impl.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_route_repository.g.dart';

@riverpod
IcarRouteRepository icarRouteRepository(Ref ref) {
  final icarRouteRemoteDatasource = ref.watch(
    icarRouteRemoteDatasourceProvider,
  );
  return IcarRouteRepositoryImpl(icarRouteRemoteDatasource);
}

abstract class IcarRouteRepository {
  Future<Either<Failure, List<IcarRoute>>> getRoutes(
    String token,
    bool polyline,
  );
  Future<Either<Failure, IcarRoute>> getRouteById(
    String token,
    int icarRouteId,
  );
}
