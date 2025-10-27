import 'package:fpdart/fpdart.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/shared/data/datasources/icar_remote_datasource.dart';
import 'package:icar/src/shared/data/datasources/icar_websocket_datasource.dart';
import 'package:icar/src/shared/data/models/icar_websocket_response_model.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_position.dart';
import 'package:icar/src/shared/domain/entities/ticket_proximity.dart';
import 'package:icar/src/shared/domain/repositories/icar_repository.dart';

class IcarRepositoryImpl extends IcarRepository {
  final IcarRemoteDatasource _icarRemote;
  final IcarWebsocketDatasource _icarWebsocket;

  IcarRepositoryImpl(this._icarRemote, this._icarWebsocket);

  @override
  Future<Either<Failure, List<Icar>>> getIcarsWithSchedulesByStopId(
    String token,
    int icarStopId,
  ) async {
    try {
      final result = await _icarRemote.getIcars(token, icarStopId: icarStopId);
      return Right(result.map((icarModel) => icarModel.toEntity()).toList());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Stream<(String, IcarPosition, int?)> getIcarPositionStream() async* {
    await for (final icarWebsocketResponseModel in _icarWebsocket.stream) {
      if (icarWebsocketResponseModel case IcarPositionWebsocketResponse()) {
        yield (
          icarWebsocketResponseModel.type,
          icarWebsocketResponseModel.icarPosition.toEntity(),
          null,
        );
      } else if (icarWebsocketResponseModel
          case IcarDisconnectedWebsocketResponse()) {
        yield (
          icarWebsocketResponseModel.type,
          icarWebsocketResponseModel.icarPosition.toEntity(),
          icarWebsocketResponseModel.canceledTickets,
        );
      }
    }
  }

  @override
  Stream<List<TicketProximity>> getTicketsProximityStream() async* {
    await for (final icarWebsocketResponseModel in _icarWebsocket.stream) {
      if (icarWebsocketResponseModel case IcarPositionWebsocketResponse()) {
        yield icarWebsocketResponseModel.ticketsProximity
            .map((ticketProximity) => ticketProximity.toEntity())
            .toList();
      }
    }
  }
}
