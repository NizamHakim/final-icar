import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:icar/data/repositories/icar_stop_repository/icar_stop_repository.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

class StopState {
  const StopState({required this.stop, required this.visible});

  final IcarStop stop;
  final bool visible;

  StopState copyWith({IcarStop? stop, bool? visible}) {
    return StopState(stop: stop ?? this.stop, visible: visible ?? this.visible);
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

@riverpod
class IcarStopStateList extends _$IcarStopStateList {
  @override
  Future<List<StopState>> build() async {
    final stopRepository = ref.watch(icarStopRepositoryProvider);
    final stopListEither = await stopRepository.getAllStops();

    return stopListEither.fold(
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

  void updateStopVisibility(String filter) async {
    final currentState = state;

    if (currentState is! AsyncData<List<StopState>>) return;

    state = AsyncData(
      currentState.value.map((stopState) {
        if (stopState.stop.name.toLowerCase().contains(filter.toLowerCase())) {
          return stopState.copyWith(visible: true);
        }
        return stopState.copyWith(visible: false);
      }).toList(),
    );
  }
}

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
