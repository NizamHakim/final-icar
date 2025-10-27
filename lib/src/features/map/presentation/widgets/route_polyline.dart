import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';

class RoutePolyline extends StatelessWidget {
  const RoutePolyline({super.key, required this.route});

  final IcarRoute route;

  @override
  Widget build(BuildContext context) {
    return PolylineLayer(
      polylines: [
        Polyline(
          points: route.polylinePoints!,
          color: route.color,
          strokeWidth: 4,
        ),
      ],
    );
  }
}
