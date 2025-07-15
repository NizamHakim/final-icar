import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/core/permissions/location/location_permission_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location.g.dart';

@riverpod
Future<Position> userLocation(Ref ref) async {
  await LocationPermissionManager.checkForPermissionOrThrow();
  final position = await Geolocator.getCurrentPosition();
  return position;
}
