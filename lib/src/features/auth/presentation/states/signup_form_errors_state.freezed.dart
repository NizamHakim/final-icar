// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form_errors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupFormErrorsState {

 String? get name; String? get email; String? get password; String? get confirmPassword;
/// Create a copy of SignupFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupFormErrorsStateCopyWith<SignupFormErrorsState> get copyWith => _$SignupFormErrorsStateCopyWithImpl<SignupFormErrorsState>(this as SignupFormErrorsState, _$identity);

  /// Serializes this SignupFormErrorsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFormErrorsState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword);

@override
String toString() {
  return 'SignupFormErrorsState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $SignupFormErrorsStateCopyWith<$Res>  {
  factory $SignupFormErrorsStateCopyWith(SignupFormErrorsState value, $Res Function(SignupFormErrorsState) _then) = _$SignupFormErrorsStateCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? password, String? confirmPassword
});




}
/// @nodoc
class _$SignupFormErrorsStateCopyWithImpl<$Res>
    implements $SignupFormErrorsStateCopyWith<$Res> {
  _$SignupFormErrorsStateCopyWithImpl(this._self, this._then);

  final SignupFormErrorsState _self;
  final $Res Function(SignupFormErrorsState) _then;

/// Create a copy of SignupFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? password = freezed,Object? confirmPassword = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,confirmPassword: freezed == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SignupFormErrorsState implements SignupFormErrorsState {
  const _SignupFormErrorsState({this.name, this.email, this.password, this.confirmPassword});
  factory _SignupFormErrorsState.fromJson(Map<String, dynamic> json) => _$SignupFormErrorsStateFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? password;
@override final  String? confirmPassword;

/// Create a copy of SignupFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupFormErrorsStateCopyWith<_SignupFormErrorsState> get copyWith => __$SignupFormErrorsStateCopyWithImpl<_SignupFormErrorsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignupFormErrorsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupFormErrorsState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword);

@override
String toString() {
  return 'SignupFormErrorsState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class _$SignupFormErrorsStateCopyWith<$Res> implements $SignupFormErrorsStateCopyWith<$Res> {
  factory _$SignupFormErrorsStateCopyWith(_SignupFormErrorsState value, $Res Function(_SignupFormErrorsState) _then) = __$SignupFormErrorsStateCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? password, String? confirmPassword
});




}
/// @nodoc
class __$SignupFormErrorsStateCopyWithImpl<$Res>
    implements _$SignupFormErrorsStateCopyWith<$Res> {
  __$SignupFormErrorsStateCopyWithImpl(this._self, this._then);

  final _SignupFormErrorsState _self;
  final $Res Function(_SignupFormErrorsState) _then;

/// Create a copy of SignupFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? password = freezed,Object? confirmPassword = freezed,}) {
  return _then(_SignupFormErrorsState(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,confirmPassword: freezed == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
