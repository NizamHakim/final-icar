import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/core/exceptions/app_failure.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/ui/features/auth/viewmodels/login/login_viewmodel.dart';
import 'package:icar/ui/features/auth/viewmodels/signup/signup_viewmodel.dart';
import 'package:icar/util/http/request_headers.dart';
import 'package:icar/util/http/response_handler.dart';
import 'package:icar/util/http/uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  Future<Either<AppFailure, User>> getAuthorizedUserData(String token) async {
    try {
      final response = await http.get(
        uriBuilder(endpoint: "/api/auth"),
        headers: getHeaders(token: token),
      );

      return handleResponse<AppFailure, User>(
        response,
        onSuccess: (json) => User.fromJson(json),
        onError: (json) => AppFailure.fromJson(json),
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<dynamic, User>> signup(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await http.post(
        uriBuilder(endpoint: "/api/auth/signup"),
        headers: getHeaders(),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );

      return handleResponse<dynamic, User>(
        response,
        onSuccess: (json) => User.fromJson(json),
        onError: (json) {
          if (response.statusCode == 422) {
            final jsonMap = json as Map<String, dynamic>;
            return SignupFormErrorsState.fromJson(jsonMap['body']);
          }
          return AppFailure.fromJson(json);
        },
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }

  Future<Either<dynamic, User>> login(String email, String password) async {
    try {
      final response = await http.post(
        uriBuilder(endpoint: "/api/auth/login"),
        headers: getHeaders(),
        body: jsonEncode({"email": email, "password": password}),
      );

      return handleResponse<dynamic, User>(
        response,
        onSuccess: (json) => User.fromJson(json),
        onError: (json) {
          if (response.statusCode == 422) {
            final jsonMap = json as Map<String, dynamic>;
            return LoginFormErrorsState.fromJson(jsonMap['body']);
          }
          return AppFailure.fromJson(json);
        },
      );
    } catch (e) {
      return Left(AppFailure(error: e.toString()));
    }
  }
}
