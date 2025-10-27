import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/onboarding/presentation/providers/should_show_onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup.g.dart';

@riverpod
Future<(bool, User?)> appStartup(Ref ref) async {
  final shouldShowOnboarding = ref.watch(shouldShowOnboardingProvider);
  final currentUser = await ref.watch(currentUserProvider.future);
  return (shouldShowOnboarding, currentUser);
}
