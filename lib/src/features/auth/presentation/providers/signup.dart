import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:icar/src/core/key/navigator_key.dart';

import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/auth/presentation/providers/signup_form_errors.dart';
import 'package:icar/src/l10n/generated/auth_localizations.dart';
import 'package:icar/src/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup.g.dart';

@riverpod
class Signup extends _$Signup {
  late AuthRepository authRepository;

  @override
  FutureOr<User?> build() {
    authRepository = ref.watch(authRepositoryProvider);
    return null;
  }

  Future<void> signup(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    state = const AsyncValue.loading();
    final signupFormErrorsNotifier = ref.read(
      signupFormErrorsProvider.notifier,
    );
    final userEither = await authRepository.signup(
      name,
      email,
      password,
      confirmPassword,
    );

    userEither.fold(
      (failure) {
        if (failure case ValidationFailure(errors: final errors)) {
          signupFormErrorsNotifier.updateError(errors);
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
