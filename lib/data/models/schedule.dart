// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:icar/data/models/icar.dart';
import 'package:icar/data/models/icar_stop.dart';

class Schedule {
  const Schedule({
    required this.id,
    required this.session,
    required this.icar,
    required this.icarStop,
    required this.arrivalTime,
    this.ticketCount,
  });

  final int id;
  final String session;
  final Icar? icar;
  final IcarStop? icarStop;
  final DateTime arrivalTime;
  final int? ticketCount;

  String get formattedDate {
    return DateFormat('EEEE, dd-MM-yyyy').format(arrivalTime);
  }

  String get formattedTime {
    return DateFormat('HH:mm').format(arrivalTime);
  }

  bool get enabled {
    return arrivalTime.isBefore(
      DateTime.now().add(const Duration(minutes: 30)),
    );
  }

  Schedule copyWith({
    int? id,
    String? session,
    Icar? icar,
    IcarStop? icarStop,
    DateTime? arrivalTime,
    int? ticketCount,
  }) {
    return Schedule(
      id: id ?? this.id,
      session: session ?? this.session,
      icar: icar ?? this.icar,
      icarStop: icarStop ?? this.icarStop,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      ticketCount: ticketCount ?? this.ticketCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'session': session,
      'icar': icar?.toMap(),
      'icarStop': icarStop?.toMap(),
      'arrivalTime': arrivalTime.toIso8601String(),
      'ticketCount': ticketCount,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'] as int,
      session: map['session'] as String,
      icar:
          map['icar'] != null
              ? Icar.fromMap(map['icar'] as Map<String, dynamic>)
              : null,
      icarStop:
          map['icarStop'] != null
              ? IcarStop.fromMap(map['icarStop'] as Map<String, dynamic>)
              : null,
      arrivalTime: DateTime.parse(map['arrivalTime'] as String).toLocal(),
      ticketCount:
          (map['_count'] != null && map['_count']['Ticket'] != null)
              ? map['_count']['Ticket'] as int
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Schedule(id: $id, session: $session, icar: $icar, icarStop: $icarStop, arrivalTime: $arrivalTime), ticketCount: $ticketCount)';
  }

  @override
  bool operator ==(covariant Schedule other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.session == session &&
        other.icar == icar &&
        other.icarStop == icarStop &&
        other.arrivalTime == arrivalTime &&
        other.ticketCount == ticketCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        session.hashCode ^
        icar.hashCode ^
        icarStop.hashCode ^
        arrivalTime.hashCode;
  }
}
