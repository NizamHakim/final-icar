import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/ui/map/widgets/icar_stop_marker/icar_stop_marker.dart';

class RouteStopsMarkers extends StatelessWidget {
  const RouteStopsMarkers({super.key, required this.route});

  final IcarRoute route;

  @override
  Widget build(BuildContext context) {
    List<IcarStop> icarStops =
        route.waypoints!.map((e) => e.icarStop!).toList();

    return MarkerLayer(
      markers: List.generate(
        icarStops.length,
        (index) => Marker(
          width: 24,
          height: 30,
          point: icarStops[index].coordinate,
          child: IcarStopMarker(color: route.color, icarStop: icarStops[index]),
        ),
      ),
    );
  }
}
