import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_local_repository.g.dart';

@riverpod
AuthLocalRepository authLocalRepository(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesInstanceProvider)!;
  return AuthLocalRepository(sharedPreferences: sharedPreferences);
}

class AuthLocalRepository {
  const AuthLocalRepository({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  void saveToken(String token) {
    sharedPreferences.setString("x-auth-token", token);
  }

  String? getToken() {
    return sharedPreferences.getString("x-auth-token");
  }

  Future<void> clearToken() async {
    await sharedPreferences.remove("x-auth-token");
  }
}
