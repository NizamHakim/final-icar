import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/core/exceptions/app_failure.dart';

part 'icar_route_repository.g.dart';

@riverpod
IcarRouteRepository icarRouteRepository(Ref ref) {
  return IcarRouteRepository(ref);
}

class IcarRouteRepository {
  final Ref ref;
  const IcarRouteRepository(this.ref);

  Future<Either<AppFailure, List<IcarRoute>>> getRoutes() async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(
          endpoint: "/api/icar-routes",
          queryParameters: {"polyline": true},
        ),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, List<IcarRoute>>(
        response,
        onSuccess: (json) {
          return (json as List)
              .map((icarRoute) => IcarRoute.fromJson(icarRoute))
              .toList();
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, IcarRoute>> getRouteById(int icarRouteId) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/icar-routes/$icarRouteId"),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, IcarRoute>(
        response,
        onSuccess: (json) => IcarRoute.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
