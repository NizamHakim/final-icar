import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/domain/entities/ticket_proximity_status.dart';

part 'ticket_proximity.freezed.dart';

@freezed
abstract class TicketProximity with _$TicketProximity {
  const TicketProximity._();

  const factory TicketProximity({
    required int ticketId,
    required int distance,
  }) = _TicketProximity;

  TicketProximityStatus? get status {
    if (distance < 100) {
      return TicketProximityStatus.ARRIVED;
    } else if (distance < 300) {
      return TicketProximityStatus.CLOSE;
    } else {
      return null;
    }
  }
}
