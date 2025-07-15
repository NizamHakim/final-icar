import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/core/providers/user_location/user_location.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_repository/icar_position/icar_position_repository.dart';
import 'package:icar/data/repositories/icar_repository/responses/icar_websocket_response.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/remote/icar_stop_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_properties_viewmodel.g.dart';
part 'map_properties_viewmodel.freezed.dart';

@riverpod
class RouteStateList extends _$RouteStateList {
  @override
  Future<List<RouteState>> build() async {
    final routeRepository = ref.watch(icarRouteRepositoryProvider);
    final routeList = await routeRepository.getRoutes();

    return routeList.fold(
      (failure) {
        throw Exception(failure.error);
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

  final icarStopListEither = await icarStopRepository.getStops(userPosition);
  return icarStopListEither.fold(
    (failure) {
      throw Exception(failure.error);
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
Stream<Map<int, Position>> icarsPositionMapStream(Ref ref) async* {
  final icarPositionRepository = ref.watch(icarPositionRepositoryProvider);
  final Map<int, Position> icarPositionMap = {};

  await for (final icarResponse in icarPositionRepository.stream) {
    if (icarResponse is PositionResponse) {
      icarPositionMap[icarResponse.icarId] = icarResponse.position;
      yield icarPositionMap;
    } else if (icarResponse is DisconnectedResponse) {
      icarPositionMap.remove(icarResponse.icar.id);
      yield icarPositionMap;
    }
  }
}

@freezed
abstract class RouteState with _$RouteState {
  const factory RouteState({required IcarRoute route, required bool visible}) =
      _RouteState;
}
