import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/core/exceptions/app_failure.dart';

part 'icar_stop_remote_repository.g.dart';

@riverpod
IcarStopRemoteRepository icarStopRemoteRepository(Ref ref) {
  return IcarStopRemoteRepository(ref);
}

class IcarStopRemoteRepository {
  final Ref ref;
  const IcarStopRemoteRepository(this.ref);

  Future<Either<AppFailure, List<IcarStop>>> getStops(
    Position userPosition,
  ) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/icar-stops"),
        headers: getHeaders(
          token: currentUser.token,
          userPosition: userPosition,
        ),
      );

      return handleResponse<AppFailure, List<IcarStop>>(
        response,
        onSuccess: (json) {
          return (json as List)
              .map((icarStop) => IcarStop.fromJson(icarStop))
              .toList();
        },
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<AppFailure, IcarStop>> getStopById(
    int icarStopId,
    Position userPosition,
  ) async {
    try {
      final currentUser = ref.read(currentUserProvider)!;
      final response = await http.get(
        uriBuilder(endpoint: "/api/icar-stops/$icarStopId"),
        headers: getHeaders(
          token: currentUser.token,
          userPosition: userPosition,
        ),
      );

      return handleResponse<AppFailure, IcarStop>(
        response,
        onSuccess: (json) => IcarStop.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
