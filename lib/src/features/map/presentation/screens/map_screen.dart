import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/location/presentation/providers/user_location.dart';
import 'package:icar/src/features/map/presentation/providers/icars_position_map_stream.dart';
import 'package:icar/src/features/map/presentation/providers/is_showing_details.dart';
import 'package:icar/src/features/map/presentation/providers/routes_visibility.dart';
import 'package:icar/src/l10n/generated/map_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/map/presentation/widgets/floating_toggle.dart';
import 'package:icar/src/features/map/presentation/widgets/icar_marker.dart';
import 'package:icar/src/features/map/presentation/widgets/route_polyline.dart';
import 'package:icar/src/features/map/presentation/widgets/icar_stops_markers/icar_stops_markers.dart';
import 'package:icar/src/features/map/presentation/widgets/user_marker.dart';
import 'package:icar/src/shared/presentation/providers/icar_stops.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';
import 'package:icar/src/features/map/presentation/widgets/scan_ar_button.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:latlong2/latlong.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    final routeList = ref.watch(routesVisibilityProvider); // initialize
    final icarStopList = ref.watch(icarStopsProvider);

    final isShowingDetail = ref.watch(isShowingDetailProvider);
    final icarsPositionMapStream = ref.watch(icarsPositionMapStreamProvider);

    Widget content;

    if (userLocation.isLoading ||
        routeList.isLoading ||
        icarStopList.isLoading) {
      content = Skeletonizer(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.white,
        ),
      );
    } else if (userLocation.hasError) {
      content = handleError(
        context,
        userLocation.error!,
        userLocation.stackTrace!,
      );
    } else if (routeList.hasError) {
      content = handleError(context, routeList.error!, routeList.stackTrace!);
    } else if (icarStopList.hasError) {
      content = handleError(
        context,
        icarStopList.error!,
        icarStopList.stackTrace!,
      );
    } else {
      final routeStates = routeList.asData!.value;
      final userLocationPosition = userLocation.asData!.value;
      final icarStops = icarStopList.asData!.value;

      content = Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(
                userLocationPosition.latitude,
                userLocationPosition.longitude,
                // -7.286326,
                // 112.794968,
              ),
              initialZoom: 16,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'icar',
              ),
              for (final routeState in routeStates)
                if (routeState.visible) RoutePolyline(route: routeState.route),
              IcarStopsMarkers(icarStops: icarStops),
              for (final routeState in routeStates)
                if (routeState.visible)
                  ...icarsPositionMapStream.when(
                    data: (icarsPositionMap) {
                      return routeState.route.icars!.map((icar) {
                        final position = icarsPositionMap[icar.id];
                        if (position == null) return const SizedBox.shrink();
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
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Text(
                '© OpenStreetMap contributors',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          if (!isShowingDetail) ...[
            const Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: FloatingToggle(),
            ),
            const Positioned(top: 10, right: 0, child: ScanArButton()),
          ],
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
