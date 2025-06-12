import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:icar/data/core/providers/user_location/user_location.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/map/screens/map_screen.dart';
import 'package:icar/ui/map/widgets/map_properties/user_marker/user_marker.dart';
import 'package:icar/util/permissions/location/widgets/location_permission_denied.dart';
import 'package:icar/util/permissions/location/widgets/location_service_disabled.dart';
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
                child: FlutterMap(
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
                      userAgentPackageName: 'com.example.app',
                    ),
                    UserMarker(position: userLocationData),
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
            child: _showErrorWidget(error),
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

  Widget _showErrorWidget(Object error) {
    if (error is LocationServiceDisabledException) {
      return const LocationServiceDisabled();
    } else if (error is PermissionDeniedException) {
      return const LocationPermissionDenied();
    } else {
      return DataNotFetched(
        text: CoreLocalizations.of(context)!.internalServerError,
      );
    }
  }
}
