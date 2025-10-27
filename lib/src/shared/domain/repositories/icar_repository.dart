import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/shared/data/datasources/icar_remote_datasource.dart';
import 'package:icar/src/shared/data/datasources/icar_websocket_datasource.dart';
import 'package:icar/src/shared/data/repositories/icar_repository_impl.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_position.dart';
import 'package:icar/src/shared/domain/entities/ticket_proximity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:icar/src/core/errors/failure.dart';

part 'icar_repository.g.dart';

@riverpod
IcarRepository icarRepository(Ref ref) {
  final icarRemoteDatasource = ref.watch(icarRemoteDatasourceProvider);
  final icarWebsocketDatasource = ref.watch(icarWebsocketDatasourceProvider);
  return IcarRepositoryImpl(icarRemoteDatasource, icarWebsocketDatasource);
}

abstract class IcarRepository {
  Future<Either<Failure, List<Icar>>> getIcarsWithSchedulesByStopId(
    String token,
    int icarStopId,
  );
  Stream<(String, IcarPosition, int?)> getIcarPositionStream();
  Stream<List<TicketProximity>> getTicketsProximityStream();
}
