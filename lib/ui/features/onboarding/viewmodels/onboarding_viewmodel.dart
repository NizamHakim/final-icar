import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/settings_repository/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_viewmodel.g.dart';

@riverpod
class OnboardingIndex extends _$OnboardingIndex {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

@riverpod
bool shouldShowOnboarding(Ref ref) {
  final settingsRepository = ref.watch(settingsRepositoryProvider);
  return settingsRepository.shouldShowOnboarding();
}
