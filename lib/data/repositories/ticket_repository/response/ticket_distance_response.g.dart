// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_distance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketDistanceResponse _$TicketDistanceResponseFromJson(
  Map<String, dynamic> json,
) => _TicketDistanceResponse(
  ticketId: (json['ticketId'] as num).toInt(),
  distanceStatus: $enumDecode(
    _$TicketDistanceStatusEnumMap,
    json['distanceStatus'],
  ),
);

Map<String, dynamic> _$TicketDistanceResponseToJson(
  _TicketDistanceResponse instance,
) => <String, dynamic>{
  'ticketId': instance.ticketId,
  'distanceStatus': _$TicketDistanceStatusEnumMap[instance.distanceStatus]!,
};

const _$TicketDistanceStatusEnumMap = {
  TicketDistanceStatus.NOTHING: 'NOTHING',
  TicketDistanceStatus.CLOSE: 'CLOSE',
  TicketDistanceStatus.ARRIVED: 'ARRIVED',
};
