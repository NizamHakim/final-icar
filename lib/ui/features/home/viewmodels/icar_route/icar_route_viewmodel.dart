import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/repositories/icar_route_repository/icar_route_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_route_viewmodel.g.dart';

@riverpod
Future<List<IcarRoute>> icarRoutesOptions(Ref ref) async {
  final routeRepository = ref.watch(icarRouteRepositoryProvider);
  final icarRoutesOptionsEither = await routeRepository.getRoutes();

  return icarRoutesOptionsEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (icarRoutesOptions) {
      return icarRoutesOptions;
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
