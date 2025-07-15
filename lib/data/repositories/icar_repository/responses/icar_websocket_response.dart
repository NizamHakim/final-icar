import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/json_converter/position_json_converter.dart';

part 'icar_websocket_response.g.dart';
part 'icar_websocket_response.freezed.dart';

enum IcarWebSocketResponseType { position, disconnected }

@Freezed(unionKey: 'type')
sealed class IcarWebSocketResponse with _$IcarWebSocketResponse {
  const factory IcarWebSocketResponse.position({
    required IcarWebSocketResponseType type,
    required int icarId,
    @JsonKey(fromJson: positionFromJson, toJson: positionToJson)
    required Position position,
  }) = PositionResponse;

  const factory IcarWebSocketResponse.disconnected({
    required IcarWebSocketResponseType type,
    required Icar icar,
  }) = DisconnectedResponse;

  factory IcarWebSocketResponse.fromJson(Map<String, dynamic> json) =>
      _$IcarWebSocketResponseFromJson(json);
}
