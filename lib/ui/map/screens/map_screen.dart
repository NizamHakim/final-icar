import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final camera = CameraOptions(
      center: Point(coordinates: Position(-98.0, 39.5)),
      zoom: 5,
      bearing: 0,
      pitch: 0,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Lacak iCar'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(child: MapWidget(cameraOptions: camera)),
    );
  }
}
