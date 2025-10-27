// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_form_errors_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupFormErrorsState _$SignupFormErrorsStateFromJson(
  Map<String, dynamic> json,
) => _SignupFormErrorsState(
  name: json['name'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  confirmPassword: json['confirmPassword'] as String?,
);

Map<String, dynamic> _$SignupFormErrorsStateToJson(
  _SignupFormErrorsState instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};
