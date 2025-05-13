// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';

class RouteWaypoint {
  const RouteWaypoint({
    required this.id,
    required this.order,
    this.icarStop,
    this.icarRoute,
  });

  final int id;
  final int order;
  final IcarStop? icarStop;
  final IcarRoute? icarRoute;

  RouteWaypoint copyWith({
    int? id,
    int? order,
    IcarStop? icarStop,
    IcarRoute? icarRoute,
  }) {
    return RouteWaypoint(
      id: id ?? this.id,
      order: order ?? this.order,
      icarStop: icarStop ?? this.icarStop,
      icarRoute: icarRoute ?? this.icarRoute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'icarStop': icarStop?.toMap(),
      'icarRoute': icarRoute?.toMap(),
    };
  }

  factory RouteWaypoint.fromMap(Map<String, dynamic> map) {
    return RouteWaypoint(
      id: map['id'] as int,
      order: map['order'] as int,
      icarStop:
          map['icarStop'] != null
              ? IcarStop.fromMap(map['icarStop'] as Map<String, dynamic>)
              : null,
      icarRoute:
          map['icarRoute'] != null
              ? IcarRoute.fromMap(map['icarRoute'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RouteWaypoint.fromJson(String source) =>
      RouteWaypoint.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RouteWaypoint(id: $id, order: $order, icarStop: $icarStop, icarRoute: $icarRoute)';
  }

  @override
  bool operator ==(covariant RouteWaypoint other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.order == order &&
        other.icarStop == icarStop &&
        other.icarRoute == icarRoute;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        order.hashCode ^
        icarStop.hashCode ^
        icarRoute.hashCode;
  }
}
