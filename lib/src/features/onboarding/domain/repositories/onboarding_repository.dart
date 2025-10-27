import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:icar/src/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_repository.g.dart';

@riverpod
OnboardingRepository onboardingRepository(Ref ref) {
  final onboardingLocalDatasource = ref.watch(
    onboardingLocalDatasourceProvider,
  );
  return OnboardingRepositoryImpl(onboardingLocalDatasource);
}

abstract class OnboardingRepository {
  bool getShouldShowOnboarding();
  void setShouldShowOnboarding(bool shouldShowOnboarding);
}
