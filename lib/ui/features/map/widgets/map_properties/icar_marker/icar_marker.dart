import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';

class IcarMarker extends StatelessWidget {
  const IcarMarker({super.key, required this.route, required this.position});

  final IcarRoute route;
  final Position position;

  @override
  Widget build(BuildContext context) {
    return AnimatedLocationMarkerLayer(
      position: LocationMarkerPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
      ),
      heading: LocationMarkerHeading(
        heading: position.heading,
        accuracy: position.headingAccuracy,
      ),
      style: LocationMarkerStyle(
        marker: _IcarMarker(color: route.color),
        markerSize: const Size(36, 42),
        markerDirection: MarkerDirection.heading,
        markerAlignment: Alignment.center,
        showHeadingSector: false,
        showAccuracyCircle: false,
      ),
    );
  }
}

class _IcarMarker extends StatelessWidget {
  const _IcarMarker({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppIcon(iconSvg: AppIconsSvg.car, color: color, size: 16);
  }
}
