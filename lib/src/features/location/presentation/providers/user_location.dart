import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/features/location/presentation/providers/check_for_location_permission_or_throw.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location.g.dart';

@Riverpod(keepAlive: true)
Stream<Position> userLocation(Ref ref) async* {
  await checkForLocationPermissionOrThrow();
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  final positionStream = Geolocator.getPositionStream(
    locationSettings: locationSettings,
  );
  await for (final position in positionStream) {
    yield position;
  }
}
