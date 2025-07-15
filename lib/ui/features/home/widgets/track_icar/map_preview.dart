import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/user_location/user_location.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/circular_loader.dart';
import 'package:icar/ui/features/map/screens/map_screen.dart';
import 'package:icar/ui/features/map/widgets/map_properties/user_marker/user_marker.dart';
import 'package:icar/util/handle_error.dart';
import 'package:latlong2/latlong.dart';

class MapPreview extends ConsumerStatefulWidget {
  const MapPreview({super.key});

  @override
  ConsumerState<MapPreview> createState() => _MapPreviewState();
}

class _MapPreviewState extends ConsumerState<MapPreview> {
  @override
  Widget build(BuildContext context) {
    final userLocation = ref.watch(userLocationProvider);
    double previewHeight = 240;

    return userLocation.when(
      data: (userLocationData) {
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
              height: previewHeight,
              child: IgnorePointer(
                child: Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(
                          userLocationData.latitude,
                          userLocationData.longitude,
                        ),
                        initialZoom: 16,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'icar',
                        ),
                        UserMarker(position: userLocationData),
                      ],
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.white,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          '© OpenStreetMap contributors',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, _) {
        return DottedBorder(
          dashPattern: const [10, 6],
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          color: AppColors.gray200,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 240,
            width: double.infinity,
            color: AppColors.white,
            child: handleError(context, error),
          ),
        );
      },
      loading: () {
        return SizedBox(
          height: previewHeight,
          width: double.infinity,
          child: const CircularLoader(),
        );
      },
    );
  }
}
