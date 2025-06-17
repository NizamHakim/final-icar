import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/data/repositories/auth_repository/auth_local_repository.dart';
import 'package:icar/data/repositories/auth_repository/auth_remote_repository.dart';

part 'login_viewmodel.freezed.dart';
part 'login_viewmodel.g.dart';

@freezed
abstract class LoginFormErrorsState with _$LoginFormErrorsState {
  const factory LoginFormErrorsState({String? email, String? password}) =
      _LoginFormErrorsState;

  factory LoginFormErrorsState.fromJson(Map<String, Object?> json) =>
      _$LoginFormErrorsStateFromJson(json);
}

@riverpod
class LoginFormError extends _$LoginFormError {
  @override
  LoginFormErrorsState build() {
    return const LoginFormErrorsState();
  }

  void updateError(LoginFormErrorsState errors) {
    state = errors;
  }
}

@riverpod
class UserLogin extends _$UserLogin {
  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final authRemoteRepository = ref.read(authRemoteRepositoryProvider);
    final authLocalRepository = ref.read(authLocalRepositoryProvider);
    final loginFormErrorNotifier = ref.read(loginFormErrorProvider.notifier);

    loginFormErrorNotifier.updateError(const LoginFormErrorsState());
    final userEither = await authRemoteRepository.login(email, password);

    userEither.fold(
      (error) {
        if (error is LoginFormErrorsState) {
          loginFormErrorNotifier.updateError(error);
          state = const AsyncValue.data(null);
        } else {
          state = AsyncValue.error(error, StackTrace.current);
        }
      },
      (loginSuccess) {
        authLocalRepository.saveToken(loginSuccess.token);
        ref.read(currentUserProvider.notifier).setUser(loginSuccess.user);
        state = AsyncValue.data(loginSuccess.user);
      },
    );
  }
}
