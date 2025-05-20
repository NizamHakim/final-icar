import 'dart:convert';
import 'package:latlong2/latlong.dart';

class IcarStop {
  IcarStop({
    required this.id,
    required this.name,
    required this.coordinate,
    this.duration,
    this.distance,
  });

  final int id;
  final String name;
  final LatLng coordinate;
  final Duration? duration;
  final int? distance;

  IcarStop copyWith({int? id, String? name, LatLng? coordinate}) {
    return IcarStop(
      id: id ?? this.id,
      name: name ?? this.name,
      coordinate: coordinate ?? this.coordinate,
      duration: duration,
      distance: distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coordinate': {'lat': coordinate.latitude, 'lng': coordinate.longitude},
      'duration': duration?.inSeconds,
      'distance': distance,
    };
  }

  factory IcarStop.fromMap(Map<String, dynamic> map) {
    final coordinate = map['coordinate'] as Map<String, dynamic>;
    return IcarStop(
      id: map['id'] as int,
      name: map['name'] as String,
      coordinate: LatLng(
        coordinate['lat'] as double,
        coordinate['lng'] as double,
      ),
      duration:
          map['duration'] != null
              ? Duration(seconds: map['duration'] as int)
              : null,
      distance: map['distance'] as int?,
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
