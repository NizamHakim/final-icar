import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_icar_route.g.dart';

@riverpod
class SelectedIcarRoute extends _$SelectedIcarRoute {
  @override
  IcarRoute? build() {
    return null;
  }

  void setSelectedRoute(IcarRoute route) {
    state = route;
  }
}
