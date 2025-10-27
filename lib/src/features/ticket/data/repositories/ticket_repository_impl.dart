import 'package:fpdart/fpdart.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/features/ticket/data/datasources/ticket_remote_datasource.dart';
import 'package:icar/src/features/ticket/data/models/review_model.dart';
import 'package:icar/src/features/ticket/domain/entities/review.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/features/ticket/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl extends TicketRepository {
  final TicketRemoteDatasource _ticketRemote;

  TicketRepositoryImpl(this._ticketRemote);

  @override
  Future<Either<Failure, Ticket?>> getClosestTicket(String token) async {
    try {
      final result = await _ticketRemote.getTickets(
        token,
        status: TicketStatus.IN_QUEUE,
        limit: 1,
      );
      return Right(result.isNotEmpty ? result[0].toEntity() : null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Ticket>>> getTicketsByStatus(
    String token,
    TicketStatus status, {
    int? cursor,
  }) async {
    try {
      final result = await _ticketRemote.getTickets(token, status: status);
      return Right(
        result.map((ticketModel) => ticketModel.toEntity()).toList(),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Ticket>> getTicket(String token, int ticketId) async {
    try {
      final result = await _ticketRemote.getTicketById(token, ticketId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, (Ticket, String)>> cancelTicket(
    String token,
    int ticketId,
  ) async {
    try {
      final (ticketModel, message) = await _ticketRemote.updateTicket(
        token,
        ticketId,
        newStatus: TicketStatus.CANCELED,
      );
      return Right((ticketModel.toEntity(), message));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, (Ticket, String)>> createTicket(
    String token,
    int scheduleId,
  ) async {
    try {
      final (ticketModel, message) = await _ticketRemote.createTicket(
        token,
        scheduleId,
      );
      return Right((ticketModel.toEntity(), message));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, (Ticket, String)>> updateStatus(
    String token,
    int ticketId,
    TicketStatus status,
  ) async {
    try {
      final (ticketModel, message) = await _ticketRemote.updateTicket(
        token,
        ticketId,
        newStatus: status,
      );
      return Right((ticketModel.toEntity(), message));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, (Ticket, String)>> updateReview(
    String token,
    int ticketId,
    Review review,
  ) async {
    try {
      final (ticketModel, message) = await _ticketRemote.updateTicket(
        token,
        ticketId,
        newReview: ReviewModel.fromEntity(review),
      );
      return Right((ticketModel.toEntity(), message));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
