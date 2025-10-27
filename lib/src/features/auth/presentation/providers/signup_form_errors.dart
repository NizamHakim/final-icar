import 'package:icar/src/features/auth/presentation/states/signup_form_errors_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_form_errors.g.dart';

@riverpod
class SignupFormErrors extends _$SignupFormErrors {
  @override
  SignupFormErrorsState build() {
    return const SignupFormErrorsState();
  }

  void updateError(Map<String, String> errors) {
    state = SignupFormErrorsState.fromJson(errors);
  }
}
