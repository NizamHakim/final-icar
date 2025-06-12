import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/data/models/user/user.dart';
import 'package:icar/data/repositories/auth_repository/auth_local_repository.dart';
import 'package:icar/data/repositories/auth_repository/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_viewmodel.freezed.dart';
part 'signup_viewmodel.g.dart';

@freezed
abstract class SignupFormErrorsState with _$SignupFormErrorsState {
  const factory SignupFormErrorsState({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) = _SignupFormErrorsState;

  factory SignupFormErrorsState.fromJson(Map<String, Object?> json) =>
      _$SignupFormErrorsStateFromJson(json);
}

@riverpod
class SignupFormError extends _$SignupFormError {
  @override
  SignupFormErrorsState build() {
    return const SignupFormErrorsState();
  }

  void updateError(SignupFormErrorsState errors) {
    state = errors;
  }
}

@riverpod
class CreateNewUser extends _$CreateNewUser {
  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> createUser(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    state = const AsyncValue.loading();
    final authRemoteRepository = ref.read(authRemoteRepositoryProvider);
    final authLocalRepository = ref.read(authLocalRepositoryProvider);
    final signupFormErrorNotifier = ref.read(signupFormErrorProvider.notifier);

    signupFormErrorNotifier.updateError(const SignupFormErrorsState());
    final userEither = await authRemoteRepository.signup(
      name,
      email,
      password,
      confirmPassword,
    );

    userEither.fold(
      (error) {
        if (error is SignupFormErrorsState) {
          ref.read(signupFormErrorProvider.notifier).updateError(error);
          state = const AsyncValue.data(null);
        } else {
          state = AsyncValue.error(error, StackTrace.current);
        }
      },
      (signupSuccess) {
        authLocalRepository.saveToken(signupSuccess.token);
        ref.read(currentUserProvider.notifier).setUser(signupSuccess.user);
        state = AsyncValue.data(signupSuccess.user);
      },
    );
  }
}
