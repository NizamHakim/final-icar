// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:icar/data/models/schedule.dart';
import 'package:latlong2/latlong.dart';

import 'package:icar/data/models/icar_route.dart';

enum IcarStatus {
  active(value: "ACTIVE"),
  inactive(value: "INACTIVE");

  const IcarStatus({required this.value});

  final String value;

  factory IcarStatus.fromValue(String value) {
    return IcarStatus.values.firstWhere((status) => status.value == value);
  }
}

class Icar {
  const Icar({
    required this.id,
    required this.name,
    required this.capacity,
    required this.position,
    required this.status,
    this.icarRoute,
    this.schedules,
  });

  final int id;
  final String name;
  final int capacity;
  final LatLng position;
  final IcarStatus status;
  final IcarRoute? icarRoute;
  final List<Schedule>? schedules;

  Map<String, List<Schedule>> get schedulesBySession {
    final Map<String, List<Schedule>> schedulesBySession = {};
    if (schedules != null) {
      for (var schedule in schedules!) {
        final session = schedule.session;
        if (!schedulesBySession.containsKey(session)) {
          schedulesBySession[session] = [];
        }
        schedulesBySession[session]!.add(schedule);
      }
    }
    return schedulesBySession;
  }

  Icar copyWith({
    int? id,
    String? name,
    int? capacity,
    LatLng? position,
    IcarStatus? status,
    IcarRoute? icarRoute,
  }) {
    return Icar(
      id: id ?? this.id,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      position: position ?? this.position,
      status: status ?? this.status,
      icarRoute: icarRoute ?? this.icarRoute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'capacity': capacity,
      'position': {'lat': position.latitude, 'lng': position.longitude},
      'status': status.value,
      'icarRoute': icarRoute?.toMap(),
    };
  }

  factory Icar.fromMap(Map<String, dynamic> map) {
    final position = map['position'] as Map<String, dynamic>;
    final temp = Icar(
      id: map['id'] as int,
      name: map['name'] as String,
      capacity: map['capacity'] as int,
      position: LatLng(position['lat'] as double, position['lng'] as double),
      status: IcarStatus.fromValue(map['status'] as String),
      icarRoute:
          map['icarRoute'] != null
              ? IcarRoute.fromMap(map['icarRoute'] as Map<String, dynamic>)
              : null,
      schedules:
          map['Schedule'] != null
              ? (map['Schedule'] as List)
                  .map((e) => Schedule.fromMap(e as Map<String, dynamic>))
                  .toList()
              : null,
    );
    return temp;
  }

  String toJson() => json.encode(toMap());

  factory Icar.fromJson(String source) =>
      Icar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Icar(id: $id, name: $name, capacity: $capacity, position: $position, status: $status, icarRoute: $icarRoute)';
  }

  @override
  bool operator ==(covariant Icar other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.capacity == capacity &&
        other.position == position &&
        other.status == status &&
        other.icarRoute == icarRoute;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        capacity.hashCode ^
        position.hashCode ^
        status.hashCode ^
        icarRoute.hashCode;
  }
}
