import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/app_failure.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/schedule/schedule.dart';

part 'schedule_repository.g.dart';

@riverpod
ScheduleRepository scheduleRepository(Ref ref) {
  return ScheduleRepository();
}

class ScheduleRepository {
  Future<Either<AppFailure, List<Schedule>>> getSchedulesByStopAndRoute(
    IcarStop icarStop,
    IcarRoute icarRoute,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${ServerConn.url}/api/schedules/icar-stop/${icarStop.id}/icar-route/${icarRoute.id}",
        ),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      List<Schedule> scheduleList = [];
      for (final schedule in jsonDecode(response.body) as List) {
        scheduleList.add(Schedule.fromJson(schedule));
      }

      return Right(scheduleList);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
