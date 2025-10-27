import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:icar/src/core/errors/exception.dart';
import 'package:icar/src/features/auth/data/models/user_model.dart';
import 'package:icar/src/utils/networks/body_builder.dart';
import 'package:icar/src/utils/networks/response_handler.dart';
import 'package:icar/src/utils/networks/headers_builder.dart';
import 'package:icar/src/utils/networks/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_datasource.g.dart';

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  return AuthRemoteDatasource();
}

class AuthRemoteDatasource {
  Future<UserModel> getUser(String token) async {
    final response = await http.get(
      uriBuilder(endpoint: "/api/auth"),
      headers: headersBuilder(token: token),
    );

    return responseHandler<UserModel>(
      response,
      onSuccess: (serverResponse) => UserModel.fromJson(serverResponse.data),
      onError: (json) => throw ServerException.fromJson(json),
    );
  }

  Future<(UserModel, String)> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await http.post(
      uriBuilder(endpoint: "/api/auth/signup"),
      headers: headersBuilder(),
      body: bodyBuilder({
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      }),
    );

    return responseHandler<(UserModel, String)>(
      response,
      onSuccess: (serverResponse) {
        return (
          UserModel.fromJson(serverResponse.data),
          serverResponse.message!,
        );
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }

  Future<(UserModel, String)> login(String email, String password) async {
    final response = await http.post(
      uriBuilder(endpoint: "/api/auth/login"),
      headers: headersBuilder(),
      body: bodyBuilder({"email": email, "password": password}),
    );

    return responseHandler<(UserModel, String)>(
      response,
      onSuccess: (serverResponse) {
        return (
          UserModel.fromJson(serverResponse.data),
          serverResponse.message!,
        );
      },
      onError: (json) => throw ServerException.fromJson(json),
    );
  }
}
