import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/map_localizations.dart';
import 'package:icar/data/core/providers/user_location/user_location.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/map/viewmodels/map_properties/map_properties_viewmodel.dart';
import 'package:icar/ui/map/viewmodels/schedule_dialog/schedule_dialog_viewmodel.dart';
import 'package:icar/ui/map/widgets/map_properties/floating_toggle.dart';
import 'package:icar/ui/map/widgets/map_properties/icar_marker/icar_marker.dart';
import 'package:icar/ui/map/widgets/map_properties/route_polyline/route_polyline.dart';
import 'package:icar/ui/map/widgets/map_properties/route_stops_markers/icar_stops_markers.dart';
import 'package:icar/ui/map/widgets/map_properties/user_marker/user_marker.dart';
import 'package:icar/util/handle_error.dart';
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
    final userLocation = ref.watch(userLocationProvider);
    final routeList = ref.watch(routeStateListProvider);
    final icarStopList = ref.watch(icarStopListProvider);

    final isShowingDetail = ref.watch(isShowingDetailProvider);
    final icarsPositionMapStream = ref.watch(icarsPositionMapStreamProvider);
    ref.watch(flutterMapControllerProvider); // initialize

    Widget content;

    if (userLocation.isLoading ||
        routeList.isLoading ||
        icarStopList.isLoading) {
      content = const CircularLoader();
    } else if (userLocation.hasError) {
      content = handleError(context, userLocation.error!);
    } else if (routeList.hasError) {
      content = handleError(context, routeList.error!);
    } else if (icarStopList.hasError) {
      content = handleError(context, icarStopList.error!);
    } else {
      final routeStates = routeList.asData!.value;
      final userLocationPosition = userLocation.asData!.value;
      final icarStops = icarStopList.asData!.value;

      content = Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const LatLng(
                // userLocationPosition.latitude,
                // userLocationPosition.longitude,
                -7.286326,
                112.794968,
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
                if (routeState.visible) RoutePolyline(route: routeState.route),
              IcarStopsMarkers(icarStops: icarStops),
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
                    error: (_, _) => [],
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
        title: Text(MapLocalizations.of(context)!.mapScreenTitle),
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
