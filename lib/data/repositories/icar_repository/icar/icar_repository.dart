import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:icar/core/exceptions/app_failure.dart';
import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/icar/icar.dart';
import 'package:http/http.dart' as http;
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_repository.g.dart';

@riverpod
IcarRepository icarRepository(Ref ref) {
  return IcarRepository(ref);
}

class IcarRepository {
  final Ref ref;
  const IcarRepository(this.ref);

  Future<Either<AppFailure, List<Icar>>> getIcarsWithScheduleByStopId(
    int icarStopId,
  ) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(
          endpoint: "/api/icars/",
          queryParameters: {"icarStopId": icarStopId},
        ),
        headers: getHeaders(token: currentUser.token),
      );

      return handleResponse<AppFailure, List<Icar>>(
        response,
        onSuccess: (json) {
          return (json as List).map((icar) => Icar.fromJson(icar)).toList();
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
