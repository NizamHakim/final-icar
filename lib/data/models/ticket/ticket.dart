import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:intl/intl.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

// ignore: constant_identifier_names
enum TicketStatus { IN_QUEUE, CANCELED, FINISHED }

@freezed
abstract class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required int id,
    required DateTime expiredAt,
    required TicketStatus status,
    required int userId,
    required int scheduleId,
    User? user,
    Schedule? schedule,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, Object?> json) => _$TicketFromJson(json);

  String get formattedExpiredDate {
    return DateFormat('EEEE, dd-MM-yyyy').format(expiredAt.toLocal());
  }

  String get formattedExpiredDate2 {
    return DateFormat('dd-MM-yyyy').format(expiredAt.toLocal());
  }

  String get formattedExpiredTime {
    return DateFormat('HH:mm').format(expiredAt.toLocal());
  }
}
