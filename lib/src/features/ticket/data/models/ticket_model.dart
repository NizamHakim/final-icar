import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/auth/data/models/user_model.dart';
import 'package:icar/src/features/schedule/data/models/schedule_model.dart';
import 'package:icar/src/features/ticket/data/models/review_model.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
abstract class TicketModel with _$TicketModel {
  const TicketModel._();

  const factory TicketModel({
    required int id,
    required DateTime arrivedAt,
    required DateTime expiredAt,
    required TicketStatus status,
    required int userId,
    required int scheduleId,
    UserModel? user,
    ScheduleModel? schedule,
    ReviewModel? review,
  }) = _TicketModel;

  factory TicketModel.fromJson(Map<String, Object?> json) =>
      _$TicketModelFromJson(json);

  Ticket toEntity() {
    return Ticket(
      id: id,
      arrivedAt: arrivedAt,
      expiredAt: expiredAt,
      status: status,
      userId: userId,
      scheduleId: scheduleId,
      user: user?.toEntity(),
      schedule: schedule?.toEntity(),
      review: review?.toEntity(),
    );
  }
}
