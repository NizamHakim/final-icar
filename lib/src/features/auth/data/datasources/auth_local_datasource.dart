import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/shared/presentation/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_local_datasource.g.dart';

@riverpod
AuthLocalDatasource authLocalDatasource(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return AuthLocalDatasource(sharedPreferences);
}

class AuthLocalDatasource {
  final SharedPreferences _sharedPreferences;

  AuthLocalDatasource(this._sharedPreferences);

  void saveToken(String token) {
    _sharedPreferences.setString("authToken", token);
  }

  String? getToken() {
    return _sharedPreferences.getString("authToken");
  }

  Future<bool> clearToken() async {
    return await _sharedPreferences.remove("authToken");
  }
}
