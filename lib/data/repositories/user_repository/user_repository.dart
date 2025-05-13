import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:icar/data/core/app_failure.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:icar/data/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository();
}

class UserRepository {
  Future<Either<AppFailure, User>> getUserById(int id) async {
    try {
      final response = await http.get(
        Uri.parse("${ServerConn.url}/api/users/$id"),
        headers: {"Content-Type": "application/json"},
      );

      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(responseMap["error"]));
      }

      return Right(User.fromMap(responseMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
