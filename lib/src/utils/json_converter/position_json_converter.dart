import 'package:geolocator/geolocator.dart';

Position? positionFromJson(Map<String, dynamic>? json) {
  if (json == null) return null;
  return Position.fromMap(json);
}

Map<String, dynamic>? positionToJson(Position? position) {
  if (position == null) return null;
  return position.toJson();
}
