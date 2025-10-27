import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/features/ticket/data/datasources/ticket_remote_datasource.dart';
import 'package:icar/src/features/ticket/data/repositories/ticket_repository_impl.dart';
import 'package:icar/src/features/ticket/domain/entities/review.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';

part 'ticket_repository.g.dart';

@riverpod
TicketRepository ticketRepository(Ref ref) {
  final ticketRemoteDatasource = ref.watch(ticketRemoteDatasourceProvider);
  return TicketRepositoryImpl(ticketRemoteDatasource);
}

abstract class TicketRepository {
  Future<Either<Failure, Ticket?>> getClosestTicket(String token);

  Future<Either<Failure, List<Ticket>>> getTicketsByStatus(
    String token,
    TicketStatus status, {
    int? cursor,
  });

  Future<Either<Failure, Ticket>> getTicket(String token, int ticketId);

  Future<Either<Failure, (Ticket, String)>> createTicket(
    String token,
    int scheduleId,
  );

  Future<Either<Failure, (Ticket, String)>> cancelTicket(
    String token,
    int ticketId,
  );

  Future<Either<Failure, (Ticket, String)>> updateStatus(
    String token,
    int ticketId,
    TicketStatus status,
  );

  Future<Either<Failure, (Ticket, String)>> updateReview(
    String token,
    int ticketId,
    Review review,
  );
}
