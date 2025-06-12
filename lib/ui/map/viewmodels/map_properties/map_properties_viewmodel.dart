import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/core/providers/user_location/user_location.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_remote_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_properties_viewmodel.g.dart';
part 'map_properties_viewmodel.freezed.dart';

@riverpod
class RouteStateList extends _$RouteStateList {
  @override
  Future<List<RouteState>> build() async {
    final routeRepository = ref.watch(icarRouteRepositoryProvider);
    final routeList = await routeRepository.getAllRoutes();

    return routeList.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (routeList) {
        return routeList
            .map((route) => RouteState(route: route, visible: true))
            .toList();
      },
    );
  }

  void toggleRouteVisibility(RouteState routeState) async {
    final currentState = state;

    if (currentState is! AsyncData<List<RouteState>>) return;

    state = AsyncData(
      currentState.value.map((route) {
        if (route.route.id == routeState.route.id) {
          return route.copyWith(visible: !route.visible);
        }
        return route;
      }).toList(),
    );
  }
}

@riverpod
Future<List<IcarStop>> icarStopList(Ref ref) async {
  final icarStopRepository = ref.watch(icarStopRemoteRepositoryProvider);
  final userPosition = await ref.watch(userLocationProvider.future);

  final icarStopListEither = await icarStopRepository.getAllStops(userPosition);
  return icarStopListEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (icarStopList) {
      return icarStopList;
    },
  );
}

@riverpod
class FlutterMapController extends _$FlutterMapController {
  @override
  MapController? build() {
    return null;
  }

  void setController(MapController mapController) {
    state = mapController;
  }
}

@riverpod
Stream<Map<int, LatLng>> icarsPositionMapStream(Ref ref) async* {
  final icarPositionRepository = ref.watch(icarPositionRepositoryProvider);
  final Map<int, LatLng> icarPositionMap = {};

  await for (final icarPosition in icarPositionRepository.stream) {
    icarPositionMap[icarPosition.icarId] = icarPosition.position;
    yield icarPositionMap;
  }
}

@freezed
abstract class RouteState with _$RouteState {
  const factory RouteState({required IcarRoute route, required bool visible}) =
      _RouteState;
}
