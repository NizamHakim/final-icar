// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_success_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSuccessResponse {

 User get user; String get token;
/// Create a copy of AuthSuccessResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSuccessResponseCopyWith<AuthSuccessResponse> get copyWith => _$AuthSuccessResponseCopyWithImpl<AuthSuccessResponse>(this as AuthSuccessResponse, _$identity);

  /// Serializes this AuthSuccessResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSuccessResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,token);

@override
String toString() {
  return 'AuthSuccessResponse(user: $user, token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthSuccessResponseCopyWith<$Res>  {
  factory $AuthSuccessResponseCopyWith(AuthSuccessResponse value, $Res Function(AuthSuccessResponse) _then) = _$AuthSuccessResponseCopyWithImpl;
@useResult
$Res call({
 User user, String token
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthSuccessResponseCopyWithImpl<$Res>
    implements $AuthSuccessResponseCopyWith<$Res> {
  _$AuthSuccessResponseCopyWithImpl(this._self, this._then);

  final AuthSuccessResponse _self;
  final $Res Function(AuthSuccessResponse) _then;

/// Create a copy of AuthSuccessResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? token = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AuthSuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AuthSuccessResponse implements AuthSuccessResponse {
  const _AuthSuccessResponse({required this.user, required this.token});
  factory _AuthSuccessResponse.fromJson(Map<String, dynamic> json) => _$AuthSuccessResponseFromJson(json);

@override final  User user;
@override final  String token;

/// Create a copy of AuthSuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSuccessResponseCopyWith<_AuthSuccessResponse> get copyWith => __$AuthSuccessResponseCopyWithImpl<_AuthSuccessResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthSuccessResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSuccessResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,token);

@override
String toString() {
  return 'AuthSuccessResponse(user: $user, token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthSuccessResponseCopyWith<$Res> implements $AuthSuccessResponseCopyWith<$Res> {
  factory _$AuthSuccessResponseCopyWith(_AuthSuccessResponse value, $Res Function(_AuthSuccessResponse) _then) = __$AuthSuccessResponseCopyWithImpl;
@override @useResult
$Res call({
 User user, String token
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthSuccessResponseCopyWithImpl<$Res>
    implements _$AuthSuccessResponseCopyWith<$Res> {
  __$AuthSuccessResponseCopyWithImpl(this._self, this._then);

  final _AuthSuccessResponse _self;
  final $Res Function(_AuthSuccessResponse) _then;

/// Create a copy of AuthSuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? token = null,}) {
  return _then(_AuthSuccessResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthSuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
