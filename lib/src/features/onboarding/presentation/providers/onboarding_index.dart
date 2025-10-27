import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_index.g.dart';

@riverpod
class OnboardingIndex extends _$OnboardingIndex {
  @override
  int build() => 0;

  void set(int index) => state = index;
}
