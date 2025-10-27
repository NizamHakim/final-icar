// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ServerException _$ServerExceptionFromJson(
  Map<String, dynamic> json
) {
        switch (json['statusCode']) {
                  case '401':
          return UnauthorizedException.fromJson(
            json
          );
                case '404':
          return NotFoundException.fromJson(
            json
          );
                case '422':
          return UnprocessableContentException.fromJson(
            json
          );
                case '500':
          return InternalServerErrorException.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'statusCode',
  'ServerException',
  'Invalid union type "${json['statusCode']}"!'
);
        }
      
}

/// @nodoc
mixin _$ServerException {

@JsonKey(fromJson: statusCodeConverter) int get statusCode; String get message;
/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this as ServerException, _$identity);

  /// Serializes this ServerException to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'ServerException(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res>  {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, String message
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? message = null,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class UnauthorizedException implements ServerException {
  const UnauthorizedException({@JsonKey(fromJson: statusCodeConverter) required this.statusCode, required this.message});
  factory UnauthorizedException.fromJson(Map<String, dynamic> json) => _$UnauthorizedExceptionFromJson(json);

@override@JsonKey(fromJson: statusCodeConverter) final  int statusCode;
@override final  String message;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedExceptionCopyWith<UnauthorizedException> get copyWith => _$UnauthorizedExceptionCopyWithImpl<UnauthorizedException>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnauthorizedExceptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'ServerException.unauthorized(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedExceptionCopyWith<$Res> implements $ServerExceptionCopyWith<$Res> {
  factory $UnauthorizedExceptionCopyWith(UnauthorizedException value, $Res Function(UnauthorizedException) _then) = _$UnauthorizedExceptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, String message
});




}
/// @nodoc
class _$UnauthorizedExceptionCopyWithImpl<$Res>
    implements $UnauthorizedExceptionCopyWith<$Res> {
  _$UnauthorizedExceptionCopyWithImpl(this._self, this._then);

  final UnauthorizedException _self;
  final $Res Function(UnauthorizedException) _then;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,}) {
  return _then(UnauthorizedException(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotFoundException implements ServerException {
  const NotFoundException({@JsonKey(fromJson: statusCodeConverter) required this.statusCode, required this.message});
  factory NotFoundException.fromJson(Map<String, dynamic> json) => _$NotFoundExceptionFromJson(json);

@override@JsonKey(fromJson: statusCodeConverter) final  int statusCode;
@override final  String message;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundExceptionCopyWith<NotFoundException> get copyWith => _$NotFoundExceptionCopyWithImpl<NotFoundException>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotFoundExceptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'ServerException.notFound(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundExceptionCopyWith<$Res> implements $ServerExceptionCopyWith<$Res> {
  factory $NotFoundExceptionCopyWith(NotFoundException value, $Res Function(NotFoundException) _then) = _$NotFoundExceptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, String message
});




}
/// @nodoc
class _$NotFoundExceptionCopyWithImpl<$Res>
    implements $NotFoundExceptionCopyWith<$Res> {
  _$NotFoundExceptionCopyWithImpl(this._self, this._then);

  final NotFoundException _self;
  final $Res Function(NotFoundException) _then;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,}) {
  return _then(NotFoundException(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UnprocessableContentException implements ServerException {
  const UnprocessableContentException({@JsonKey(fromJson: statusCodeConverter) required this.statusCode, required this.message, required final  Map<String, String> errors}): _errors = errors;
  factory UnprocessableContentException.fromJson(Map<String, dynamic> json) => _$UnprocessableContentExceptionFromJson(json);

@override@JsonKey(fromJson: statusCodeConverter) final  int statusCode;
@override final  String message;
 final  Map<String, String> _errors;
 Map<String, String> get errors {
  if (_errors is EqualUnmodifiableMapView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_errors);
}


/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnprocessableContentExceptionCopyWith<UnprocessableContentException> get copyWith => _$UnprocessableContentExceptionCopyWithImpl<UnprocessableContentException>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnprocessableContentExceptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnprocessableContentException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'ServerException.unprocessableContent(statusCode: $statusCode, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $UnprocessableContentExceptionCopyWith<$Res> implements $ServerExceptionCopyWith<$Res> {
  factory $UnprocessableContentExceptionCopyWith(UnprocessableContentException value, $Res Function(UnprocessableContentException) _then) = _$UnprocessableContentExceptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, String message, Map<String, String> errors
});




}
/// @nodoc
class _$UnprocessableContentExceptionCopyWithImpl<$Res>
    implements $UnprocessableContentExceptionCopyWith<$Res> {
  _$UnprocessableContentExceptionCopyWithImpl(this._self, this._then);

  final UnprocessableContentException _self;
  final $Res Function(UnprocessableContentException) _then;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,Object? errors = null,}) {
  return _then(UnprocessableContentException(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InternalServerErrorException implements ServerException {
  const InternalServerErrorException({@JsonKey(fromJson: statusCodeConverter) required this.statusCode, required this.message});
  factory InternalServerErrorException.fromJson(Map<String, dynamic> json) => _$InternalServerErrorExceptionFromJson(json);

@override@JsonKey(fromJson: statusCodeConverter) final  int statusCode;
@override final  String message;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternalServerErrorExceptionCopyWith<InternalServerErrorException> get copyWith => _$InternalServerErrorExceptionCopyWithImpl<InternalServerErrorException>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternalServerErrorExceptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerErrorException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'ServerException.internalServerError(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $InternalServerErrorExceptionCopyWith<$Res> implements $ServerExceptionCopyWith<$Res> {
  factory $InternalServerErrorExceptionCopyWith(InternalServerErrorException value, $Res Function(InternalServerErrorException) _then) = _$InternalServerErrorExceptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, String message
});




}
/// @nodoc
class _$InternalServerErrorExceptionCopyWithImpl<$Res>
    implements $InternalServerErrorExceptionCopyWith<$Res> {
  _$InternalServerErrorExceptionCopyWithImpl(this._self, this._then);

  final InternalServerErrorException _self;
  final $Res Function(InternalServerErrorException) _then;

/// Create a copy of ServerException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,}) {
  return _then(InternalServerErrorException(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
