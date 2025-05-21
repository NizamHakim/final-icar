import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:latlong2/latlong.dart';

class IcarMarker extends StatelessWidget {
  const IcarMarker({super.key, required this.route, required this.position});

  final IcarRoute route;
  final LatLng position;

  @override
  Widget build(BuildContext context) {
    return AnimatedLocationMarkerLayer(
      position: LocationMarkerPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: 0,
      ),
      style: LocationMarkerStyle(
        marker: _IcarMarker(color: route.color),
        markerSize: const Size(36, 42),
        markerDirection: MarkerDirection.heading,
        markerAlignment: Alignment.center,
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
