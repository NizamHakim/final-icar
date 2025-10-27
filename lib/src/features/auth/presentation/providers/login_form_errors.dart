import 'package:icar/src/features/auth/presentation/states/login_form_errors_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_errors.g.dart';

@riverpod
class LoginFormErrors extends _$LoginFormErrors {
  @override
  LoginFormErrorsState build() {
    return const LoginFormErrorsState();
  }

  void updateError(Map<String, String> errors) {
    state = LoginFormErrorsState.fromJson(errors);
  }
}
