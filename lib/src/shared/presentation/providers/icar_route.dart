import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/repositories/icar_route_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_route.g.dart';

@riverpod
Future<IcarRoute> icarRoute(Ref ref, int icarRouteId) async {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final icarRouteRepository = ref.watch(icarRouteRepositoryProvider);
  final routeEither = await icarRouteRepository.getRouteById(
    currentUser.token,
    icarRouteId,
  );

  return routeEither.fold(
    (failure) {
      throw failure;
    },
    (icarRoute) {
      return icarRoute;
    },
  );
}

final fakeIcarRoute = const IcarRoute(
  id: 0,
  name: "Dummy Route",
  color: Colors.black,
);
