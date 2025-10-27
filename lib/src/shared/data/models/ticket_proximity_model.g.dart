// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_proximity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketProximityModel _$TicketProximityModelFromJson(
  Map<String, dynamic> json,
) => _TicketProximityModel(
  ticketId: (json['ticketId'] as num).toInt(),
  distance: (json['distance'] as num).toInt(),
);

Map<String, dynamic> _$TicketProximityModelToJson(
  _TicketProximityModel instance,
) => <String, dynamic>{
  'ticketId': instance.ticketId,
  'distance': instance.distance,
};
