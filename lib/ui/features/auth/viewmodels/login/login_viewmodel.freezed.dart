// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginFormErrorsState {

 String? get email; String? get password;
/// Create a copy of LoginFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFormErrorsStateCopyWith<LoginFormErrorsState> get copyWith => _$LoginFormErrorsStateCopyWithImpl<LoginFormErrorsState>(this as LoginFormErrorsState, _$identity);

  /// Serializes this LoginFormErrorsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFormErrorsState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginFormErrorsState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginFormErrorsStateCopyWith<$Res>  {
  factory $LoginFormErrorsStateCopyWith(LoginFormErrorsState value, $Res Function(LoginFormErrorsState) _then) = _$LoginFormErrorsStateCopyWithImpl;
@useResult
$Res call({
 String? email, String? password
});




}
/// @nodoc
class _$LoginFormErrorsStateCopyWithImpl<$Res>
    implements $LoginFormErrorsStateCopyWith<$Res> {
  _$LoginFormErrorsStateCopyWithImpl(this._self, this._then);

  final LoginFormErrorsState _self;
  final $Res Function(LoginFormErrorsState) _then;

/// Create a copy of LoginFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? password = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LoginFormErrorsState implements LoginFormErrorsState {
  const _LoginFormErrorsState({this.email, this.password});
  factory _LoginFormErrorsState.fromJson(Map<String, dynamic> json) => _$LoginFormErrorsStateFromJson(json);

@override final  String? email;
@override final  String? password;

/// Create a copy of LoginFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormErrorsStateCopyWith<_LoginFormErrorsState> get copyWith => __$LoginFormErrorsStateCopyWithImpl<_LoginFormErrorsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginFormErrorsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFormErrorsState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginFormErrorsState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginFormErrorsStateCopyWith<$Res> implements $LoginFormErrorsStateCopyWith<$Res> {
  factory _$LoginFormErrorsStateCopyWith(_LoginFormErrorsState value, $Res Function(_LoginFormErrorsState) _then) = __$LoginFormErrorsStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? password
});




}
/// @nodoc
class __$LoginFormErrorsStateCopyWithImpl<$Res>
    implements _$LoginFormErrorsStateCopyWith<$Res> {
  __$LoginFormErrorsStateCopyWithImpl(this._self, this._then);

  final _LoginFormErrorsState _self;
  final $Res Function(_LoginFormErrorsState) _then;

/// Create a copy of LoginFormErrorsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? password = freezed,}) {
  return _then(_LoginFormErrorsState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
