import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';
import 'package:icar/ui/features/map/widgets/map_properties/user_marker/user_clipper.dart';

class UserMarker extends StatelessWidget {
  const UserMarker({super.key, required this.position});

  final Position position;

  @override
  Widget build(BuildContext context) {
    return AnimatedLocationMarkerLayer(
      position: LocationMarkerPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
      ),
      style: const LocationMarkerStyle(
        marker: _UserMarker(),
        markerSize: Size(36, 42),
        markerDirection: MarkerDirection.top,
        markerAlignment: Alignment.topCenter,
        showHeadingSector: false,
      ),
    );
  }
}

class _UserMarker extends StatelessWidget {
  const _UserMarker();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UserClipper(),
      child: Container(
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 4,
          bottom: 4 + 6,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.rectangle,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary500,
            shape: BoxShape.circle,
          ),
          child: const AppIcon(
            iconSvg: AppIconsSvg.personHand,
            color: AppColors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
