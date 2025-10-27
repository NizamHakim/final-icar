import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/location/presentation/providers/user_location.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:icar/src/features/map/presentation/widgets/user_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrackIcarMap extends ConsumerStatefulWidget {
  const TrackIcarMap({super.key});

  @override
  ConsumerState<TrackIcarMap> createState() => _TrackIcarMapState();
}

class _TrackIcarMapState extends ConsumerState<TrackIcarMap> {
  @override
  Widget build(BuildContext context) {
    final userLocation = ref.watch(userLocationProvider);
    double previewHeight = 240;

    return userLocation.when(
      data: (userLocationData) {
        return InkWell(
          onTap: () => context.go("/home/map"),
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
      error: (error, stackTrace) {
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
            child: handleError(context, error, stackTrace),
          ),
        );
      },
      loading: () {
        return Skeletonizer(
          enabled: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: previewHeight,
              width: double.infinity,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
