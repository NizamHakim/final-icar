import 'package:icar/data/models/icar_route/icar_route.dart';

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
