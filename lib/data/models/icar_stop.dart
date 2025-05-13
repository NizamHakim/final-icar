// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class IcarStop {
  const IcarStop({
    required this.id,
    required this.name,
    required this.coordinate,
  });

  final int id;
  final String name;
  final Point coordinate;

  IcarStop copyWith({int? id, String? name, Point? coordinate}) {
    return IcarStop(
      id: id ?? this.id,
      name: name ?? this.name,
      coordinate: coordinate ?? this.coordinate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coordinate': {
        'lat': coordinate.coordinates.lat,
        'lng': coordinate.coordinates.lng,
      },
    };
  }

  factory IcarStop.fromMap(Map<String, dynamic> map) {
    final coordinate = map['coordinate'] as Map<String, dynamic>;
    return IcarStop(
      id: map['id'] as int,
      name: map['name'] as String,
      coordinate: Point(
        coordinates: Position(coordinate['lng'], coordinate['lat']),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory IcarStop.fromJson(String source) =>
      IcarStop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IcarStop(id: $id, name: $name, coordinate: $coordinate)';

  @override
  bool operator ==(covariant IcarStop other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.coordinate == coordinate;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ coordinate.hashCode;
}
