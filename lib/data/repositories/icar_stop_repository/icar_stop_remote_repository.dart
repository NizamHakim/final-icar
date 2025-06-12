import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/exceptions/app_failure.dart';

part 'icar_stop_remote_repository.g.dart';

@riverpod
IcarStopRemoteRepository icarStopRemoteRepository(Ref ref) {
  return IcarStopRemoteRepository();
}

class IcarStopRemoteRepository {
  Future<Either<AppFailure, List<IcarStop>>> getAllStops(
    Position userPosition,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${ServerConn.httpUrl}/api/icar-stops/${userPosition.latitude},${userPosition.longitude}",
        ),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      List<IcarStop> stopList = [];
      for (final stop in jsonDecode(response.body) as List) {
        stopList.add(IcarStop.fromJson(stop));
      }

      return Right(stopList);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, IcarStop>> getStopById(
    IcarStop icarStop,
    Position userPosition,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${ServerConn.httpUrl}/api/icar-stops/${userPosition.latitude},${userPosition.longitude}/${icarStop.id}",
        ),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(IcarStop.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
