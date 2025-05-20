// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:icar/data/models/route_waypoint.dart';
import 'package:latlong2/latlong.dart';

class IcarRoute {
  const IcarRoute({
    required this.id,
    required this.name,
    required this.color,
    this.waypoints,
    this.polylinePoints,
  });

  final int id;
  final String name;
  final Color color;
  final List<RouteWaypoint>? waypoints;
  final List<LatLng>? polylinePoints;

  IcarRoute copyWith({int? id, String? name, List<RouteWaypoint>? waypoints}) {
    return IcarRoute(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color,
      waypoints: waypoints ?? this.waypoints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color': color.toString(),
      'RouteWaypoint': waypoints?.map((x) => x.toMap()).toList(),
      'polylinePoints':
          polylinePoints
              ?.map((x) => {'latitude': x.latitude, 'longitude': x.longitude})
              .toList(),
    };
  }

  factory IcarRoute.fromMap(Map<String, dynamic> map) {
    return IcarRoute(
      id: map['id'] as int,
      name: map['name'] as String,
      color: Color(int.parse(map['hexColor'] as String)),
      waypoints:
          map['RouteWaypoint'] != null
              ? List<RouteWaypoint>.from(
                (map['RouteWaypoint'] as List<dynamic>).map<RouteWaypoint?>(
                  (x) => RouteWaypoint.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      polylinePoints:
          map['polyline'] != null
              ? List<LatLng>.from(
                (map['polyline'] as List<dynamic>).map<LatLng?>(
                  (x) => LatLng(x['lat'] as double, x['lng'] as double),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IcarRoute.fromJson(String source) =>
      IcarRoute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IcarRoute(id: $id, name: $name, color: $color, waypoints: $waypoints)';

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
