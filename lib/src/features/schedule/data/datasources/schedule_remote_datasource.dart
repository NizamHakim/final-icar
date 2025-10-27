import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:icar/src/core/errors/exception.dart';
import 'package:icar/src/features/schedule/data/models/schedule_model.dart';
import 'package:icar/src/utils/networks/headers_builder.dart';
import 'package:icar/src/utils/networks/response_handler.dart';
import 'package:icar/src/utils/networks/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_remote_datasource.g.dart';

@riverpod
ScheduleRemoteDatasource scheduleRemoteDatasource(Ref ref) {
  return ScheduleRemoteDatasource();
}

class ScheduleRemoteDatasource {
  Future<List<ScheduleModel>> getSchedules(
    String token, {
    int? icarStopId,
    int? icarRouteId,
  }) async {
    final response = await http.get(
      uriBuilder(
        endpoint: "/api/schedules",
        queryParameters: {"icarStopId": icarStopId, "icarRouteId": icarRouteId},
      ),
      headers: headersBuilder(token: token),
    );

    return responseHandler<List<ScheduleModel>>(
      response,
      onSuccess: (serverResponse) {
        return (serverResponse.data as List)
            .map((schedule) => ScheduleModel.fromJson(schedule))
            .toList();
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }
}
