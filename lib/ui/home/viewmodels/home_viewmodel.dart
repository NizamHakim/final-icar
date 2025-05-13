import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/data/models/ticket.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_repository.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class SelectedStop extends _$SelectedStop {
  @override
  IcarStop? build() {
    return null;
  }

  void setSelectedStop(IcarStop stop) {
    state = stop;
  }
}

@riverpod
class SelectedRoute extends _$SelectedRoute {
  @override
  IcarRoute? build() {
    return null;
  }

  void setSelectedRoute(IcarRoute route) {
    state = route;
  }
}

@riverpod
class SearchStop extends _$SearchStop {
  @override
  String build() {
    return "";
  }

  void setSearchValue(String search) {
    state = search;
  }
}

class StopState {
  const StopState({required this.stop, required this.visible});

  final IcarStop stop;
  final bool visible;
}

@riverpod
Future<List<StopState>> stopList(Ref ref) async {
  final stopRepository = ref.watch(icarStopRepositoryProvider);
  final data = await stopRepository.getAllStops();

  return data.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (stopList) {
      final stopStateList =
          stopList.map((stop) {
            return StopState(stop: stop, visible: true);
          }).toList();
      return stopStateList;
    },
  );
}

@riverpod
Future<List<StopState>> filteredStopList(Ref ref) async {
  final searchValue = ref.watch(searchStopProvider);
  final stops = await ref.watch(stopListProvider.future);

  return stops.map((stopState) {
    return StopState(
      stop: stopState.stop,
      visible: stopState.stop.name.toLowerCase().contains(
        searchValue.toLowerCase(),
      ),
    );
  }).toList();
}

@riverpod
Future<List<IcarRoute>> routeList(Ref ref) async {
  final routeRepository = ref.watch(icarRouteRepositoryProvider);
  final data = await routeRepository.getAllRoutes();

  return data.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (routeList) {
      return routeList;
    },
  );
}

@riverpod
Future<Ticket?> closestTicket(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final data = await ticketRepository.getClosestTicket();

  return data.fold(
    (failure) {
      throw Exception(failure.message);
    },
    (ticket) {
      return ticket;
    },
  );
}
