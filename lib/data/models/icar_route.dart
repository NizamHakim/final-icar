// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:icar/data/models/route_waypoint.dart';

class IcarRoute {
  const IcarRoute({required this.id, required this.name, this.waypoints});

  final int id;
  final String name;
  final List<RouteWaypoint>? waypoints;

  IcarRoute copyWith({int? id, String? name, List<RouteWaypoint>? waypoints}) {
    return IcarRoute(
      id: id ?? this.id,
      name: name ?? this.name,
      waypoints: waypoints ?? this.waypoints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'RouteWaypoint': waypoints?.map((x) => x.toMap()).toList(),
    };
  }

  factory IcarRoute.fromMap(Map<String, dynamic> map) {
    return IcarRoute(
      id: map['id'] as int,
      name: map['name'] as String,
      waypoints:
          map['RouteWaypoint'] != null
              ? List<RouteWaypoint>.from(
                (map['RouteWaypoint'] as List<dynamic>).map<RouteWaypoint?>(
                  (x) => RouteWaypoint.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IcarRoute.fromJson(String source) =>
      IcarRoute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IcarRoute(id: $id, name: $name, waypoints: $waypoints)';

  @override
  bool operator ==(covariant IcarRoute other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.waypoints, waypoints);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ waypoints.hashCode;
}
