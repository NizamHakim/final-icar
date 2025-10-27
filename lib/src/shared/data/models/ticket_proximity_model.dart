import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/domain/entities/ticket_proximity.dart';

part 'ticket_proximity_model.freezed.dart';
part 'ticket_proximity_model.g.dart';

@freezed
abstract class TicketProximityModel with _$TicketProximityModel {
  const TicketProximityModel._();

  const factory TicketProximityModel({
    required int ticketId,
    required int distance,
  }) = _TicketProximityModel;

  factory TicketProximityModel.fromJson(Map<String, Object?> json) =>
      _$TicketProximityModelFromJson(json);

  TicketProximity toEntity() {
    return TicketProximity(ticketId: ticketId, distance: distance);
  }
}
