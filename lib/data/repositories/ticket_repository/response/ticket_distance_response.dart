import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/ticket/ticket.dart';

part 'ticket_distance_response.g.dart';
part 'ticket_distance_response.freezed.dart';

@freezed
abstract class TicketDistanceResponse with _$TicketDistanceResponse {
  const factory TicketDistanceResponse({
    required int ticketId,
    required TicketDistanceStatus distanceStatus,
  }) = _TicketDistanceResponse;

  factory TicketDistanceResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketDistanceResponseFromJson(json);
}
