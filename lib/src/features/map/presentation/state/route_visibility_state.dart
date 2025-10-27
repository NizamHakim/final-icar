import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';

part 'route_visibility_state.freezed.dart';

@freezed
abstract class RouteVisibilityState with _$RouteVisibilityState {
  const factory RouteVisibilityState({
    required IcarRoute route,
    required bool visible,
  }) = _RouteVisibilityState;
}
