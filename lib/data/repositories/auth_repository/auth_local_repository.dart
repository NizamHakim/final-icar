import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_local_repository.g.dart';

@riverpod
AuthLocalRepository authLocalRepository(Ref ref) {
  return const AuthLocalRepository();
}

class AuthLocalRepository {
  const AuthLocalRepository();

  void saveToken(SharedPreferences sharedPreferences, String token) {
    sharedPreferences.setString("x-auth-token", token);
  }

  String? getToken(SharedPreferences sharedPreferences) {
    return sharedPreferences.getString("x-auth-token");
  }

  void clearToken(SharedPreferences sharedPreferences) {
    sharedPreferences.remove("x-auth-token");
  }
}
