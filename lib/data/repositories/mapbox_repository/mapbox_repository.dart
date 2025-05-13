import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/app_failure.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mapbox_repository.g.dart';

@riverpod
MapboxRepository mapboxRepository(Ref ref) {
  return MapboxRepository();
}

class MapboxRepository {
  Future<Either<AppFailure, String>> getMapboxToken() async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.url}/api/mapbox/access-token"),
        headers: {"Content-Type": "application/json"},
      );

      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(responseMap["accessToken"]);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
