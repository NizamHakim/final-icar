import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/shared/presentation/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_local_datasource.g.dart';

@riverpod
ProfileLocalDatasource profileLocalDatasource(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return ProfileLocalDatasource(sharedPreferences);
}

class ProfileLocalDatasource {
  final SharedPreferences _sharedPreferences;

  const ProfileLocalDatasource(this._sharedPreferences);

  String? getLocale() {
    return _sharedPreferences.getString("locale");
  }

  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString("locale", locale);
  }
}
