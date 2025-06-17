import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/map/widgets/map_properties/icar_stops_markers/icar_stop_marker.dart';

class IcarStopsMarkers extends StatelessWidget {
  const IcarStopsMarkers({super.key, required this.icarStops});

  final List<IcarStop> icarStops;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: List.generate(
        icarStops.length,
        (index) => Marker(
          width: 30,
          height: 38,
          rotate: true,
          alignment: Alignment.topCenter,
          point: icarStops[index].coordinate,
          child: IcarStopMarker(icarStop: icarStops[index]),
        ),
      ),
    );
  }
}
