import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/key/navigator_key.dart';

import 'package:icar/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/l10n/generated/auth_localizations.dart';
import 'package:icar/src/l10n/generated/failure_localizations.dart';
import 'package:icar/src/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout.g.dart';

@riverpod
Future<void> logout(Ref ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  final success = await authRepository.logout();
  if (success) {
    showSnackBar(
      navigatorKey.currentContext!,
      AuthLocalizations.of(
        navigatorKey.currentContext!,
      )!.authSuccess('logout_success'),
    );
    ref.read(currentUserProvider.notifier).setUser(null);
  } else {
    FailureLocalizations.of(
      navigatorKey.currentContext!,
    )!.failure('logout_failed');
  }
}
