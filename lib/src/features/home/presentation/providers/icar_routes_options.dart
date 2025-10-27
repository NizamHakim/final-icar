import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_status.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/domain/entities/route_stop_waypoint.dart';
import 'package:icar/src/shared/domain/repositories/icar_route_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_routes_options.g.dart';

@riverpod
Future<List<IcarRoute>> icarRoutesOptions(Ref ref) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final icarRouteRepository = ref.watch(icarRouteRepositoryProvider);
  final icarRoutesOptionsEither = await icarRouteRepository.getRoutes(
    currentUser.token,
    false,
  );

  return icarRoutesOptionsEither.fold(
    (failure) {
      throw failure;
    },
    (icarRoutesOptions) {
      return icarRoutesOptions;
    },
  );
}

final fakeIcarRoutes = List.generate(
  2,
  (index) => IcarRoute(
    id: 0,
    name: "Dummy Route",
    color: Colors.black,
    icars: [
      const Icar(
        id: 0,
        name: "Dummy Icar",
        capacity: 0,
        status: IcarStatus.ACTIVE,
        icarRouteId: 0,
      ),
    ],
    routeStopWaypoints: List.generate(
      6,
      (index) => const RouteStopWaypoint(
        id: 0,
        icarRouteId: 0,
        icarStopId: 0,
        order: 0,
        icarStop: IcarStop(id: 0, name: "Dummy Stop", coordinate: LatLng(0, 0)),
      ),
    ),
  ),
);
