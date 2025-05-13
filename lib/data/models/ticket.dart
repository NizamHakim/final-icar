// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:icar/data/models/schedule.dart';

enum TicketStatus {
  finished,
  canceled,
  inQueue;

  String get value => name.toUpperCase();

  factory TicketStatus.fromValue(String name) {
    return TicketStatus.values.firstWhere(
      (status) => status.value == name.toUpperCase(),
    );
  }
}

class Ticket {
  const Ticket({
    required this.id,
    required this.schedule,
    required this.status,
    required this.expiredAt,
    this.review,
  });

  final int id;
  final Schedule? schedule;
  final TicketStatus status;
  final DateTime expiredAt;
  final String? review;

  String get formattedDate {
    return DateFormat('EEEE, dd-MMMM-yyyy').format(expiredAt);
  }

  String get formattedTime {
    return DateFormat('HH:mm').format(expiredAt);
  }

  Ticket copyWith({
    int? id,
    Schedule? schedule,
    TicketStatus? status,
    DateTime? expiredAt,
    String? review,
  }) {
    return Ticket(
      id: id ?? this.id,
      schedule: schedule ?? this.schedule,
      status: status ?? this.status,
      expiredAt: expiredAt ?? this.expiredAt,
      review: review ?? this.review,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'schedule': schedule?.toMap(),
      'status': status.value,
      'expiredAt': expiredAt.toIso8601String(),
      'review': review,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as int,
      schedule:
          map['schedule'] != null
              ? Schedule.fromMap(map['schedule'] as Map<String, dynamic>)
              : null,
      status: TicketStatus.fromValue(map['status'] as String),
      expiredAt: DateTime.parse(map['expiredAt'] as String),
      review: map['review'] != null ? map['review'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) =>
      Ticket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Ticket(id: $id, schedule: $schedule, status: $status, expiredAt: $expiredAt, review: $review)';
  }

  @override
  bool operator ==(covariant Ticket other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.schedule == schedule &&
        other.status == status &&
        other.expiredAt == expiredAt &&
        other.review == review;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        schedule.hashCode ^
        status.hashCode ^
        expiredAt.hashCode ^
        review.hashCode;
  }
}
