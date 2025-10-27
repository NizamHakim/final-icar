// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerResponseModel {

@JsonKey(fromJson: statusCodeConverter) int get statusCode; dynamic get data; String? get message; PaginationModel? get pagination;
/// Create a copy of ServerResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerResponseModelCopyWith<ServerResponseModel> get copyWith => _$ServerResponseModelCopyWithImpl<ServerResponseModel>(this as ServerResponseModel, _$identity);

  /// Serializes this ServerResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,const DeepCollectionEquality().hash(data),message,pagination);

@override
String toString() {
  return 'ServerResponseModel(statusCode: $statusCode, data: $data, message: $message, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $ServerResponseModelCopyWith<$Res>  {
  factory $ServerResponseModelCopyWith(ServerResponseModel value, $Res Function(ServerResponseModel) _then) = _$ServerResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, dynamic data, String? message, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$ServerResponseModelCopyWithImpl<$Res>
    implements $ServerResponseModelCopyWith<$Res> {
  _$ServerResponseModelCopyWithImpl(this._self, this._then);

  final ServerResponseModel _self;
  final $Res Function(ServerResponseModel) _then;

/// Create a copy of ServerResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? data = freezed,Object? message = freezed,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of ServerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ServerResponseModel extends ServerResponseModel {
  const _ServerResponseModel({@JsonKey(fromJson: statusCodeConverter) required this.statusCode, required this.data, this.message, this.pagination}): super._();
  factory _ServerResponseModel.fromJson(Map<String, dynamic> json) => _$ServerResponseModelFromJson(json);

@override@JsonKey(fromJson: statusCodeConverter) final  int statusCode;
@override final  dynamic data;
@override final  String? message;
@override final  PaginationModel? pagination;

/// Create a copy of ServerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerResponseModelCopyWith<_ServerResponseModel> get copyWith => __$ServerResponseModelCopyWithImpl<_ServerResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerResponseModel&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,const DeepCollectionEquality().hash(data),message,pagination);

@override
String toString() {
  return 'ServerResponseModel(statusCode: $statusCode, data: $data, message: $message, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$ServerResponseModelCopyWith<$Res> implements $ServerResponseModelCopyWith<$Res> {
  factory _$ServerResponseModelCopyWith(_ServerResponseModel value, $Res Function(_ServerResponseModel) _then) = __$ServerResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: statusCodeConverter) int statusCode, dynamic data, String? message, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$ServerResponseModelCopyWithImpl<$Res>
    implements _$ServerResponseModelCopyWith<$Res> {
  __$ServerResponseModelCopyWithImpl(this._self, this._then);

  final _ServerResponseModel _self;
  final $Res Function(_ServerResponseModel) _then;

/// Create a copy of ServerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? data = freezed,Object? message = freezed,Object? pagination = freezed,}) {
  return _then(_ServerResponseModel(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of ServerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
