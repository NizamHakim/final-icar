import 'dart:convert';

import 'package:geolocator/geolocator.dart';

Map<String, String> getHeaders({
  String? token,
  Position? userPosition,
  int? icarId,
  Position? icarPosition,
}) {
  final headers = <String, String>{"Content-Type": "application/json"};

  if (token != null) {
    headers["x-auth-token"] = token;
  }

  if (userPosition != null) {
    headers["x-user-position"] = jsonEncode({
      "latitude": userPosition.latitude,
      "longitude": userPosition.longitude,
    });
  }

  if (icarPosition != null) {
    headers["x-icar"] = jsonEncode({
      "id": icarId,
      "position": {
        "latitude": icarPosition.latitude,
        "longitude": icarPosition.longitude,
      },
    });
  }

  return headers;
}
