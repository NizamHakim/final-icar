import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/models/icar.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/data/repositories/icar_repository/icar_repository.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_viewmodel.g.dart';

class RouteState {
  IcarRoute route;
  bool visible;

  RouteState({required this.route, required this.visible});

  RouteState copyWith({IcarRoute? route, bool? visible}) {
    return RouteState(
      route: route ?? this.route,
      visible: visible ?? this.visible,
    );
  }
}

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
Future<List<IcarStop>> stopList(Ref ref) async {
  final stopRepository = ref.watch(icarStopRepositoryProvider);
  final stopEither = await stopRepository.getAllStops();

  return stopEither.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (stopList) {
      return stopList;
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
Future<List<Icar>> icarList(Ref ref, IcarStop icarStop) async {
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

@riverpod
class IcarSchedulePageController extends _$IcarSchedulePageController {
  @override
  int build() {
    return 0;
  }

  void next() {
    state = state + 1;
  }

  void previous() {
    state = state - 1;
  }
}
