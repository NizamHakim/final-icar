import 'package:flutter/material.dart';
import 'package:icar/ui/map/screens/map_screen.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapPreview extends StatefulWidget {
  const MapPreview({super.key});

  @override
  State<MapPreview> createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> {
  late MapboxMap mapboxMap;
  PointAnnotationManager? pointAnnotationManager;

  @override
  Widget build(BuildContext context) {
    final camera = CameraOptions(
      center: Point(coordinates: Position(-98.0, 39.5)),
      zoom: 5,
      bearing: 0,
      pitch: 0,
    );

    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const MapScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: IgnorePointer(child: MapWidget(cameraOptions: camera)),
        ),
      ),
    );
  }
}
