// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:intl/intl.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

enum ScheduleSession { SESSION_1, SESSION_2 }

@freezed
abstract class Schedule with _$Schedule {
  const Schedule._();

  const factory Schedule({
    required int id,
    required ScheduleSession session,
    required DateTime arrivalTime,
    required int icarId,
    required int icarStopId,
    Icar? icar,
    IcarStop? icarStop,
    List<Ticket>? tickets,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, Object?> json) =>
      _$ScheduleFromJson(json);

  String formattedArrivalDate(Locale locale) {
    return DateFormat(
      'EEEE, dd-MM-yyyy',
      locale.languageCode,
    ).format(arrivalTime.toLocal());
  }

  String formattedArrivalTime(Locale locale) {
    return DateFormat(
      'HH:mm',
      locale.languageCode,
    ).format(arrivalTime.toLocal());
  }

  bool get isEnabled {
    return arrivalTime.isBefore(
      DateTime.now().add(const Duration(minutes: 30)),
    );
  }
}
