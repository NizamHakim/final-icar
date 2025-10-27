import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/data/models/icar_position_model.dart';
import 'package:icar/src/shared/data/models/ticket_proximity_model.dart';

part 'icar_websocket_response_model.freezed.dart';
part 'icar_websocket_response_model.g.dart';

@Freezed(unionKey: 'type')
sealed class IcarWebsocketResponseModel with _$IcarWebsocketResponseModel {
  const factory IcarWebsocketResponseModel.position({
    required String type,
    required IcarPositionModel icarPosition,
    required List<TicketProximityModel> ticketsProximity,
  }) = IcarPositionWebsocketResponse;
  const factory IcarWebsocketResponseModel.disconnect({
    required String type,
    required IcarPositionModel icarPosition,
    required int canceledTickets,
  }) = IcarDisconnectedWebsocketResponse;

  factory IcarWebsocketResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IcarWebsocketResponseModelFromJson(json);
}
