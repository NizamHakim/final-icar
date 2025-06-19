import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_repository.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesInstanceProvider)!;
  return SettingsRepository(sharedPreferences: sharedPreferences);
}

class SettingsRepository {
  const SettingsRepository({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  String? getLocale() {
    return sharedPreferences.getString("locale");
  }

  Future<void> setLocale(String locale) async {
    await sharedPreferences.setString("locale", locale);
  }

  bool shouldShowOnboarding() {
    final hasSeenOnboarding =
        sharedPreferences.getBool('first_launch') ?? false;
    if (!hasSeenOnboarding) {
      sharedPreferences.setBool('first_launch', true);
      return true;
    }
    return false;
  }
}
