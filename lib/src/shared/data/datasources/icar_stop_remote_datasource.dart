import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:icar/src/core/errors/exception.dart';
import 'package:icar/src/shared/data/models/icar_stop_model.dart';
import 'package:icar/src/utils/networks/headers_builder.dart';
import 'package:icar/src/utils/networks/response_handler.dart';
import 'package:icar/src/utils/networks/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icar_stop_remote_datasource.g.dart';

@riverpod
IcarStopRemoteDatasource icarStopRemoteDatasource(Ref ref) {
  return IcarStopRemoteDatasource();
}

class IcarStopRemoteDatasource {
  Future<List<IcarStopModel>> getStops(
    String token,
    Position userPosition,
  ) async {
    final response = await http.get(
      uriBuilder(endpoint: "/api/icar-stops"),
      headers: headersBuilder(token: token, userPosition: userPosition),
    );
    return responseHandler<List<IcarStopModel>>(
      response,
      onSuccess: (serverResponse) {
        return (serverResponse.data as List)
            .map((icarStop) => IcarStopModel.fromJson(icarStop))
            .toList();
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }

  Future<IcarStopModel> getStopById(
    String token,
    Position userPosition,
    int icarStopId,
  ) async {
    final response = await http.get(
      uriBuilder(endpoint: "/api/icar-stops/$icarStopId"),
      headers: headersBuilder(token: token, userPosition: userPosition),
    );

    return responseHandler<IcarStopModel>(
      response,
      onSuccess:
          (serverResponse) => IcarStopModel.fromJson(serverResponse.data),
      onError: (json) => throw ServerException.fromJson(json),
    );
  }
}
