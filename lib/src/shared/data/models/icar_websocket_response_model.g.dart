// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icar_websocket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IcarPositionWebsocketResponse _$IcarPositionWebsocketResponseFromJson(
  Map<String, dynamic> json,
) => IcarPositionWebsocketResponse(
  type: json['type'] as String,
  icarPosition: IcarPositionModel.fromJson(
    json['icarPosition'] as Map<String, dynamic>,
  ),
  ticketsProximity:
      (json['ticketsProximity'] as List<dynamic>)
          .map((e) => TicketProximityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$IcarPositionWebsocketResponseToJson(
  IcarPositionWebsocketResponse instance,
) => <String, dynamic>{
  'type': instance.type,
  'icarPosition': instance.icarPosition,
  'ticketsProximity': instance.ticketsProximity,
};

IcarDisconnectedWebsocketResponse _$IcarDisconnectedWebsocketResponseFromJson(
  Map<String, dynamic> json,
) => IcarDisconnectedWebsocketResponse(
  type: json['type'] as String,
  icarPosition: IcarPositionModel.fromJson(
    json['icarPosition'] as Map<String, dynamic>,
  ),
  canceledTickets: (json['canceledTickets'] as num).toInt(),
);

Map<String, dynamic> _$IcarDisconnectedWebsocketResponseToJson(
  IcarDisconnectedWebsocketResponse instance,
) => <String, dynamic>{
  'type': instance.type,
  'icarPosition': instance.icarPosition,
  'canceledTickets': instance.canceledTickets,
};
