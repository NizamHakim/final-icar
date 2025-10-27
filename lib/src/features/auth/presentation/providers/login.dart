import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/core/key/navigator_key.dart';

import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/auth/presentation/providers/login_form_errors.dart';
import 'package:icar/src/l10n/generated/auth_localizations.dart';
import 'package:icar/src/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

@riverpod
class Login extends _$Login {
  late AuthRepository authRepository;

  @override
  FutureOr<User?> build() {
    authRepository = ref.watch(authRepositoryProvider);
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final loginFormErrorsNotifier = ref.read(loginFormErrorsProvider.notifier);
    final userEither = await authRepository.login(email, password);

    userEither.fold(
      (failure) {
        if (failure case ValidationFailure(errors: final errors)) {
          loginFormErrorsNotifier.updateError(errors);
          state = const AsyncData(null);
        } else {
          state = AsyncError(failure, StackTrace.current);
          showSnackBar(
            navigatorKey.currentContext!,
            failure.message,
            textColor: AppColors.white,
            backgroundColor: AppColors.error500,
          );
        }
      },
      (data) {
        final (user, message) = data;
        authRepository.cacheUser(user.token);
        ref.read(currentUserProvider.notifier).setUser(user);
        state = AsyncData(user);
        showSnackBar(
          navigatorKey.currentContext!,
          AuthLocalizations.of(
            navigatorKey.currentContext!,
          )!.authSuccess(message),
        );
      },
    );
  }
}
