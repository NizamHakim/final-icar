// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_websocket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionResponse _$PositionResponseFromJson(Map<String, dynamic> json) =>
    PositionResponse(
      type: $enumDecode(_$IcarWebSocketResponseTypeEnumMap, json['type']),
      icarId: (json['icarId'] as num).toInt(),
      position: positionFromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PositionResponseToJson(PositionResponse instance) =>
    <String, dynamic>{
      'type': _$IcarWebSocketResponseTypeEnumMap[instance.type]!,
      'icarId': instance.icarId,
      'position': positionToJson(instance.position),
    };

const _$IcarWebSocketResponseTypeEnumMap = {
  IcarWebSocketResponseType.position: 'position',
  IcarWebSocketResponseType.disconnected: 'disconnected',
};

DisconnectedResponse _$DisconnectedResponseFromJson(
  Map<String, dynamic> json,
) => DisconnectedResponse(
  type: $enumDecode(_$IcarWebSocketResponseTypeEnumMap, json['type']),
  icar: Icar.fromJson(json['icar'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DisconnectedResponseToJson(
  DisconnectedResponse instance,
) => <String, dynamic>{
  'type': _$IcarWebSocketResponseTypeEnumMap[instance.type]!,
  'icar': instance.icar,
};
