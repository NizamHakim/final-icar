import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/core/providers/user_location.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/map/viewmodels/map_viewmodel.dart';
import 'package:icar/ui/map/widgets/map_properties/floating_toggle.dart';
import 'package:icar/ui/map/widgets/map_properties/icar_marker/icar_marker.dart';
import 'package:icar/ui/map/widgets/map_properties/route_polyline/route_polyline.dart';
import 'package:icar/ui/map/widgets/map_properties/route_stops_markers/route_stops_markers.dart';
import 'package:icar/ui/map/widgets/map_properties/user_marker/user_marker.dart';
import 'package:icar/ui/core/errors/location_permission_denied.dart';
import 'package:icar/ui/core/errors/location_service_disabled.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final routeList = ref.watch(routeStateListProvider);
    final userLocation = ref.watch(userLocationProvider);
    final isShowingDetail = ref.watch(isShowingDetailProvider);
    final icarsPositionMapStream = ref.watch(icarsPositionMapStreamProvider);
    ref.watch(flutterMapControllerProvider); // prevent rebuild

    Widget content;

    if (routeList.isLoading || userLocation.isLoading) {
      content = const Center(child: CircularLoader(size: 16));
    } else if (userLocation.hasError) {
      final error = userLocation.error;

      if (error is LocationServiceDisabledException) {
        content = const LocationServiceDisabled();
      } else if (error is PermissionDeniedException) {
        content = const LocationPermissionDenied();
      } else {
        content = DataNotFetched(text: error.toString());
      }
    } else if (routeList.hasError) {
      content = const DataNotFetched(text: 'Error loading route list');
    } else {
      final routeStates = routeList.asData!.value;
      final userLocationPosition = userLocation.asData!.value;

      content = Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(
                userLocationPosition.latitude,
                userLocationPosition.longitude,
              ),
              initialZoom: 16,
              onMapReady: () {
                ref
                    .read(flutterMapControllerProvider.notifier)
                    .setController(mapController);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              for (final routeState in routeStates)
                if (routeState.visible) ...[
                  RoutePolyline(route: routeState.route),
                  RouteStopsMarkers(route: routeState.route),
                ],
              for (final routeState in routeStates)
                if (routeState.visible)
                  ...icarsPositionMapStream.when(
                    data: (icarsPositionMap) {
                      return routeState.route.icars!.map((icar) {
                        final position =
                            icarsPositionMap[icar.id] ??
                            const LatLng(-7.280328, 112.79137);

                        return IcarMarker(
                          route: routeState.route,
                          position: position,
                        );
                      }).toList();
                    },
                    loading: () => [],
                    error: (error, _) => [],
                  ),
              UserMarker(position: userLocationPosition),
            ],
          ),
          if (!isShowingDetail)
            const Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: FloatingToggle(),
            ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Lacak iCar'),
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: RootContainer(padding: EdgeInsets.zero, child: content),
    );
  }
}
