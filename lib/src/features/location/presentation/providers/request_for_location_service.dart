import 'package:geolocator/geolocator.dart';

Future<void> requestForLocationService() async {
  await Geolocator.openLocationSettings();
}
