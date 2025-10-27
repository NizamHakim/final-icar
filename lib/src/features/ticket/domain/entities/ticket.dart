import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/ticket/domain/entities/review.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';

part 'ticket.freezed.dart';

@freezed
abstract class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required int id,
    required DateTime arrivedAt,
    required DateTime expiredAt,
    required TicketStatus status,
    required int userId,
    required int scheduleId,
    User? user,
    Schedule? schedule,
    Review? review,
  }) = _Ticket;
}
