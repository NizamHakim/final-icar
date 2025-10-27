import 'package:icar/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'should_show_onboarding.g.dart';

@riverpod
class ShouldShowOnboarding extends _$ShouldShowOnboarding {
  late OnboardingRepository onboardingRepository;

  @override
  bool build() {
    onboardingRepository = ref.watch(onboardingRepositoryProvider);
    return onboardingRepository.getShouldShowOnboarding();
  }

  void setShouldShowOnboarding(bool shouldShowOnboarding) {
    state = shouldShowOnboarding;
    onboardingRepository.setShouldShowOnboarding(shouldShowOnboarding);
  }
}
