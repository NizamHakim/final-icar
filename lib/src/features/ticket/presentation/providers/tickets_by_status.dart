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

part 'tickets_by_status.g.dart';

@riverpod
Future<List<Ticket>> ticketsByStatus(Ref ref, TicketStatus status) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  final ticketsEither = await ticketRepository.getTicketsByStatus(
    currentUser.token,
    status,
  );

  return ticketsEither.fold(
    (failure) {
      throw failure;
    },
    (tickets) {
      return tickets;
    },
  );
}

final fakeTicketsList = List.generate(
  3,
  (index) => Ticket(
    id: 0,
    arrivedAt: DateTime.now(),
    expiredAt: DateTime.now(),
    status: TicketStatus.IN_QUEUE,
    userId: 0,
    scheduleId: 1,
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
        name: "Dummy Icar",
        capacity: 0,
        status: IcarStatus.ACTIVE,
        icarRouteId: 0,
        icarRoute: IcarRoute(id: 0, name: "Dummy Route", color: Colors.black),
      ),
    ),
  ),
);
