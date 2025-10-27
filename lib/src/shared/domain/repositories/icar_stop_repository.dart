import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/shared/data/datasources/icar_stop_local_datasource.dart';
import 'package:icar/src/shared/data/datasources/icar_stop_remote_datasource.dart';
import 'package:icar/src/shared/data/repositories/icar_stop_repository_impl.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stop_repository.g.dart';

@riverpod
IcarStopRepository icarStopRepository(Ref ref) {
  final icarStopRemoteDatasource = ref.watch(icarStopRemoteDatasourceProvider);
  final icarStopLocalDatasource = ref.watch(icarStopLocalDatasourceProvider);
  return IcarStopRepositoryImpl(
    icarStopRemoteDatasource,
    icarStopLocalDatasource,
  );
}

abstract class IcarStopRepository {
  Future<Either<Failure, List<IcarStop>>> getStops(
    String token,
    Position userPosition,
  );
  Future<Either<Failure, IcarStop>> getStopById(
    String token,
    Position userPosition,
    int icarStopId,
  );
  List<int> getStopsHistory();
  void addStopToHistory(int stopId);
}
