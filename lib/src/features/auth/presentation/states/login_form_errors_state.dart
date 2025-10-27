import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_errors_state.freezed.dart';
part 'login_form_errors_state.g.dart';

@freezed
abstract class LoginFormErrorsState with _$LoginFormErrorsState {
  const factory LoginFormErrorsState({String? email, String? password}) =
      _LoginFormErrorsState;

  factory LoginFormErrorsState.fromJson(Map<String, Object?> json) =>
      _$LoginFormErrorsStateFromJson(json);
}
