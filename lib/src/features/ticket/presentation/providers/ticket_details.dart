import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/features/ticket/domain/repositories/ticket_repository.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_status.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_details.g.dart';

@riverpod
Future<Ticket> ticketDetails(Ref ref, int ticketId) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketEither = await ticketRepository.getTicket(
    currentUser.token,
    ticketId,
  );

  return ticketEither.fold(
    (failure) {
      throw failure;
    },
    (ticket) {
      return ticket;
    },
  );
}

final fakeTicketDetails = Ticket(
  id: 0,
  arrivedAt: DateTime.now(),
  expiredAt: DateTime.now(),
  status: TicketStatus.IN_QUEUE,
  userId: 0,
  scheduleId: 0,
  schedule: Schedule(
    id: 0,
    session: ScheduleSession.SESSION_1,
    arrivalTime: DateTime.now(),
    icarId: 0,
    icarStopId: 0,
    icarStop: const IcarStop(
      id: 0,
      name: "Dummy Stop",
      coordinate: LatLng(0, 0),
    ),
    icar: const Icar(
      id: 0,
      name: "Dummy Car",
      capacity: 6,
      status: IcarStatus.ACTIVE,
      icarRouteId: 0,
      icarRoute: IcarRoute(id: 0, name: "Dummy Route", color: Colors.black),
    ),
    ticketCount: 0,
  ),
);
