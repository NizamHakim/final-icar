import 'package:geolocator/geolocator.dart';

Future<void> checkForLocationPermissionOrThrow() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) throw const LocationServiceDisabledException();

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    throw const PermissionDeniedException(null);
  }
}
