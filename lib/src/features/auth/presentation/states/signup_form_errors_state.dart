import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_form_errors_state.freezed.dart';
part 'signup_form_errors_state.g.dart';

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
