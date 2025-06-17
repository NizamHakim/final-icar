import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/exceptions/app_failure.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/ui/auth/viewmodels/login/login_viewmodel.dart';
import 'package:icar/ui/auth/viewmodels/signup/signup_viewmodel.dart';
import 'package:icar/util/app_dot_env.dart';
import 'package:icar/util/future_timeout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  Future<Either<AppFailure, User>> getAuthorizedUserData(String token) async {
    try {
      final response = await futureTimeout(
        http.get(
          Uri.parse("${AppDotEnv.httpUrl}/api/auth"),
          headers: {"Content-Type": "application/json", "x-auth-token": token},
        ),
      );
      if (response.statusCode != 200) {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(User.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<dynamic, AuthSuccessResponse>> signup(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await futureTimeout(
        http.post(
          Uri.parse("${AppDotEnv.httpUrl}/api/auth/signup"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": name,
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword,
          }),
        ),
      );

      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        if (response.statusCode == 422) {
          final validationErrors = responseMap['body'] as Map<String, dynamic>;
          return Left(SignupFormErrorsState.fromJson(validationErrors));
        }

        return Left(AppFailure(responseMap["error"]));
      }

      final signupSuccess = AuthSuccessResponse(
        user: User.fromJson(responseMap['user']),
        token: responseMap['token'],
      );

      return Right(signupSuccess);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<dynamic, AuthSuccessResponse>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await futureTimeout(
        http.post(
          Uri.parse("${AppDotEnv.httpUrl}/api/auth/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": password}),
        ),
      );

      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        if (response.statusCode == 422) {
          final validationErrors = responseMap['body'] as Map<String, dynamic>;
          return Left(LoginFormErrorsState.fromJson(validationErrors));
        }

        return Left(AppFailure(responseMap["error"]));
      }

      final loginSuccess = AuthSuccessResponse(
        user: User.fromJson(responseMap['user']),
        token: responseMap['token'],
      );

      return Right(loginSuccess);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}

class AuthSuccessResponse {
  final User user;
  final String token;

  AuthSuccessResponse({required this.user, required this.token});
}
