import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:icar/src/shared/data/models/server_response_model.dart';

T responseHandler<T>(
  http.Response response, {
  required T Function(ServerResponseModel serverResponse) onSuccess,
  required T Function(dynamic json) onError,
}) {
  final jsonDecoded = jsonDecode(response.body) as Map<String, dynamic>;

  if (jsonDecoded['success']) {
    return onSuccess.call(ServerResponseModel.fromJson(jsonDecoded));
  } else {
    return onError.call(jsonDecoded);
  }
}
