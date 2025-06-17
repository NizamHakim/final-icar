import 'package:geolocator/geolocator.dart';

Position positionFromJson(Map<String, dynamic> json) {
  return Position.fromMap(json);
}

Map<String, dynamic> positionToJson(Position position) {
  return position.toJson();
}
