import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geofencing_tickets_inqueue.g.dart';

@Riverpod(keepAlive: true)
Stream<Map<int, TicketDistanceStatus>> geofencingTicketsInQueue(
  Ref ref,
) async* {
  final icarPositionRepository = ref.watch(icarPositionRepositoryProvider);
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final currentUser = ref.watch(currentUserProvider)!;

  final Map<int, TicketDistanceStatus> ticketDistanceStatusMap = {};

  await for (final icarPosition in icarPositionRepository.stream) {
    final ticketDistanceResponse = await ticketRepository
        .getTicketsDistanceStatus(currentUser, icarPosition);

    ticketDistanceResponse.fold(
      (failure) {
        return;
      },
      (ticketDistanceList) {
        for (final ticketDistance in ticketDistanceList) {
          ticketDistanceStatusMap[ticketDistance.ticketId] =
              ticketDistance.distanceStatus;
        }
      },
    );
    yield ticketDistanceStatusMap;
  }
}
