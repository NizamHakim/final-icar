// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_position_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IcarPositionResponse {

 int get icarId;@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng get position;
/// Create a copy of IcarPositionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarPositionResponseCopyWith<IcarPositionResponse> get copyWith => _$IcarPositionResponseCopyWithImpl<IcarPositionResponse>(this as IcarPositionResponse, _$identity);

  /// Serializes this IcarPositionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarPositionResponse&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icarId,position);

@override
String toString() {
  return 'IcarPositionResponse(icarId: $icarId, position: $position)';
}


}

/// @nodoc
abstract mixin class $IcarPositionResponseCopyWith<$Res>  {
  factory $IcarPositionResponseCopyWith(IcarPositionResponse value, $Res Function(IcarPositionResponse) _then) = _$IcarPositionResponseCopyWithImpl;
@useResult
$Res call({
 int icarId,@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng position
});




}
/// @nodoc
class _$IcarPositionResponseCopyWithImpl<$Res>
    implements $IcarPositionResponseCopyWith<$Res> {
  _$IcarPositionResponseCopyWithImpl(this._self, this._then);

  final IcarPositionResponse _self;
  final $Res Function(IcarPositionResponse) _then;

/// Create a copy of IcarPositionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icarId = null,Object? position = null,}) {
  return _then(_self.copyWith(
icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IcarPositionResponse implements IcarPositionResponse {
  const _IcarPositionResponse({required this.icarId, @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) required this.position});
  factory _IcarPositionResponse.fromJson(Map<String, dynamic> json) => _$IcarPositionResponseFromJson(json);

@override final  int icarId;
@override@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) final  LatLng position;

/// Create a copy of IcarPositionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarPositionResponseCopyWith<_IcarPositionResponse> get copyWith => __$IcarPositionResponseCopyWithImpl<_IcarPositionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarPositionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarPositionResponse&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icarId,position);

@override
String toString() {
  return 'IcarPositionResponse(icarId: $icarId, position: $position)';
}


}

/// @nodoc
abstract mixin class _$IcarPositionResponseCopyWith<$Res> implements $IcarPositionResponseCopyWith<$Res> {
  factory _$IcarPositionResponseCopyWith(_IcarPositionResponse value, $Res Function(_IcarPositionResponse) _then) = __$IcarPositionResponseCopyWithImpl;
@override @useResult
$Res call({
 int icarId,@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng position
});




}
/// @nodoc
class __$IcarPositionResponseCopyWithImpl<$Res>
    implements _$IcarPositionResponseCopyWith<$Res> {
  __$IcarPositionResponseCopyWithImpl(this._self, this._then);

  final _IcarPositionResponse _self;
  final $Res Function(_IcarPositionResponse) _then;

/// Create a copy of IcarPositionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icarId = null,Object? position = null,}) {
  return _then(_IcarPositionResponse(
icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
