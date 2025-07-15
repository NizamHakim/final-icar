import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/core/exceptions/app_failure.dart';
import 'package:icar/data/models/schedule/schedule.dart';

part 'schedule_repository.g.dart';

@riverpod
ScheduleRepository scheduleRepository(Ref ref) {
  return ScheduleRepository(ref);
}

class ScheduleRepository {
  final Ref ref;
  const ScheduleRepository(this.ref);

  Future<Either<AppFailure, List<Schedule>>> getSchedulesByStopAndRoute(
    int icarStopId,
    int icarRouteId,
  ) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(
          endpoint: "/api/schedules",
          queryParameters: {
            "icarStopId": icarStopId,
            "icarRouteId": icarRouteId,
          },
        ),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, List<Schedule>>(
        response,
        onSuccess: (json) {
          return (json as List)
              .map((schedule) => Schedule.fromJson(schedule))
              .toList();
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
