import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/shared/presentation/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_local_datasource.g.dart';

@riverpod
OnboardingLocalDatasource onboardingLocalDatasource(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return OnboardingLocalDatasource(sharedPreferences);
}

class OnboardingLocalDatasource {
  final SharedPreferences _sharedPreferences;

  OnboardingLocalDatasource(this._sharedPreferences);

  bool? getShouldShowOnboarding() {
    return _sharedPreferences.getBool("shouldShowOnboarding");
  }

  void setShouldShowOnboarding(bool shouldShowOnboarding) {
    _sharedPreferences.setBool("shouldShowOnboarding", shouldShowOnboarding);
  }
}
