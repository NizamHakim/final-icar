import 'package:geolocator/geolocator.dart';
import 'package:icar/src/features/location/presentation/providers/request_for_location_service.dart';

Future<void> requestForLocationPermission() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await requestForLocationService();
    return;
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
    return;
  }

  if (permission == LocationPermission.deniedForever) {
    await Geolocator.openAppSettings();
    return;
  }
}
