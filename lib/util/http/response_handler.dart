import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

const _successCodes = [200, 201];

Either<E, T> handleResponse<E, T>(
  http.Response response, {
  required T Function(dynamic json) onSuccess,
  required E Function(dynamic json) onError,
}) {
  if (!_successCodes.contains(response.statusCode)) {
    return Left(onError.call(jsonDecode(response.body)));
  }
  return Right(onSuccess.call(jsonDecode(response.body)));
}
