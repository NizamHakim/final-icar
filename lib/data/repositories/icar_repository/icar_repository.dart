import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:icar/data/core/app_failure.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/icar.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/models/icar_stop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_repository.g.dart';

@riverpod
IcarRepository icarRepository(Ref ref) {
  return IcarRepository();
}

class IcarRepository {
  Future<Either<AppFailure, List<Icar>>> getIcarsWithScheduleByStopId(
    IcarStop icarStop,
  ) async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.url}/api/icars/icar-stop/${icarStop.id}"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      final responseList = jsonDecode(response.body) as List;

      List<Icar> icarList = [];
      for (final icar in responseList) {
        icarList.add(Icar.fromMap(icar));
      }

      return Right(icarList);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
