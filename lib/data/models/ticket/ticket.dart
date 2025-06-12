// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/ticket/review.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:intl/intl.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

enum TicketDistanceStatus { NOTHING, CLOSE, ARRIVED }

enum TicketStatus {
  IN_QUEUE(
    foregroundColor: AppColors.success500,
    backgroundColor: AppColors.success50,
  ),
  CANCELED(
    foregroundColor: AppColors.error500,
    backgroundColor: AppColors.error50,
  ),
  FINISHED(
    foregroundColor: AppColors.primary500,
    backgroundColor: AppColors.primary50,
  );

  const TicketStatus({
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final Color foregroundColor;
  final Color backgroundColor;
}

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
    Review? review,
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
