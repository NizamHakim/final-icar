import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/core/exceptions/app_failure.dart';

part 'icar_route_repository.g.dart';

@riverpod
IcarRouteRepository icarRouteRepository(Ref ref) {
  return IcarRouteRepository();
}

class IcarRouteRepository {
  Future<Either<AppFailure, List<IcarRoute>>> getAllRoutes() async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.url}/api/icar-routes"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      List<IcarRoute> icarRouteList = [];
      for (final icarRoute in jsonDecode(response.body) as List) {
        icarRouteList.add(IcarRoute.fromJson(icarRoute));
      }

      return Right(icarRouteList);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
