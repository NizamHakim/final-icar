import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/shared/domain/entities/ticket_proximity_status.dart';
import 'package:icar/src/shared/domain/repositories/icar_repository.dart';
import 'package:icar/src/shared/presentation/providers/handle_ticket_proximity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tickets_proximity_map_stream.g.dart';

@Riverpod(keepAlive: true)
Stream<Map<int, TicketProximityStatus?>> ticketsProximityMapStream(
  Ref ref,
) async* {
  final icarRepository = ref.watch(icarRepositoryProvider);
  final Map<int, TicketProximityStatus?> ticketsProximityMap = {};
  final ticketsProximityStream = icarRepository.getTicketsProximityStream();

  await for (final ticketsProximity in ticketsProximityStream) {
    for (final ticket in ticketsProximity) {
      ticketsProximityMap[ticket.ticketId] = ticket.status;

      if (ticket.status == TicketProximityStatus.CLOSE) {
        handleTicketProximityClose(ref, ticket.ticketId);
      } else if (ticket.status == TicketProximityStatus.ARRIVED) {
        handleTicketProximityArrived(ref, ticket.ticketId);
        ticketsProximityMap.remove(ticket.ticketId);
      }
    }
    yield ticketsProximityMap;
  }
}
