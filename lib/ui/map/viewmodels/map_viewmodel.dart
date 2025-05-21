import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/data/repositories/icar_repository/icar_repository.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_repository.dart';
import 'package:icar/ui/map/viewmodels/states.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_viewmodel.g.dart';

// map_screen
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
class IsShowingDetail extends _$IsShowingDetail {
  @override
  bool build() {
    return false;
  }

  void showDetail() {
    state = true;
  }

  void hideDetail() {
    state = false;
  }
}

@riverpod
Stream<Map<int, LatLng>> icarsPositionMapStream(Ref ref) async* {
  final icarPositionStream = ref.watch(icarPositionStreamProvider);
  final Map<int, LatLng> icarPositionMap = {};

  await for (final icarPosition in icarPositionStream.stream) {
    final icarId = icarPosition['icarId'] as int;
    final position = icarPosition['position'] as Map<String, dynamic>;

    icarPositionMap[icarId] = LatLng(
      position['latitude'] as double,
      position['longitude'] as double,
    );

    yield icarPositionMap;
  }
}

// schedule dialog
@riverpod
Future<IcarStop> icarStopDetail(
  Ref ref,
  IcarStop icarStop,
  Position userPosition,
) async {
  final stopRepository = ref.watch(icarStopRepositoryProvider);
  final stopEither = await stopRepository.getStopById(icarStop, userPosition);

  return stopEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (stop) {
      return stop;
    },
  );
}

@riverpod
Future<List<Icar>> icarWithSchedulesList(Ref ref, IcarStop icarStop) async {
  final icarRepository = ref.watch(icarRepositoryProvider);
  final icarListEither = await icarRepository.getIcarsWithScheduleByStopId(
    icarStop,
  );

  return icarListEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (icarListData) {
      return icarListData;
    },
  );
}
