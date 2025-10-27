import 'package:latlong2/latlong.dart';

LatLng latLngFromJson(Map<String, dynamic> json) {
  return LatLng(json['latitude'] as double, json['longitude'] as double);
}

Map<String, double> latLngToJson(LatLng latLng) {
  return {'latitude': latLng.latitude, 'longitude': latLng.longitude};
}

List<LatLng>? listLatLngFromJson(List<dynamic>? latLngList) {
  if (latLngList == null) return null;
  return latLngList.map((latLng) {
    return latLngFromJson(latLng);
  }).toList();
}

List<Map<String, double>>? listLatLngToJson(List<LatLng>? latLngList) {
  if (latLngList == null) return null;
  return latLngList.map((latLng) => latLngToJson(latLng)).toList();
}
