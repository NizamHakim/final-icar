// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_options_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewOptionsResponse {

 Map<int, List<String>> get reviewOptions;
/// Create a copy of ReviewOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewOptionsResponseCopyWith<ReviewOptionsResponse> get copyWith => _$ReviewOptionsResponseCopyWithImpl<ReviewOptionsResponse>(this as ReviewOptionsResponse, _$identity);

  /// Serializes this ReviewOptionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewOptionsResponse&&const DeepCollectionEquality().equals(other.reviewOptions, reviewOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reviewOptions));

@override
String toString() {
  return 'ReviewOptionsResponse(reviewOptions: $reviewOptions)';
}


}

/// @nodoc
abstract mixin class $ReviewOptionsResponseCopyWith<$Res>  {
  factory $ReviewOptionsResponseCopyWith(ReviewOptionsResponse value, $Res Function(ReviewOptionsResponse) _then) = _$ReviewOptionsResponseCopyWithImpl;
@useResult
$Res call({
 Map<int, List<String>> reviewOptions
});




}
/// @nodoc
class _$ReviewOptionsResponseCopyWithImpl<$Res>
    implements $ReviewOptionsResponseCopyWith<$Res> {
  _$ReviewOptionsResponseCopyWithImpl(this._self, this._then);

  final ReviewOptionsResponse _self;
  final $Res Function(ReviewOptionsResponse) _then;

/// Create a copy of ReviewOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviewOptions = null,}) {
  return _then(_self.copyWith(
reviewOptions: null == reviewOptions ? _self.reviewOptions : reviewOptions // ignore: cast_nullable_to_non_nullable
as Map<int, List<String>>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReviewOptionsResponse implements ReviewOptionsResponse {
  const _ReviewOptionsResponse({required final  Map<int, List<String>> reviewOptions}): _reviewOptions = reviewOptions;
  factory _ReviewOptionsResponse.fromJson(Map<String, dynamic> json) => _$ReviewOptionsResponseFromJson(json);

 final  Map<int, List<String>> _reviewOptions;
@override Map<int, List<String>> get reviewOptions {
  if (_reviewOptions is EqualUnmodifiableMapView) return _reviewOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_reviewOptions);
}


/// Create a copy of ReviewOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewOptionsResponseCopyWith<_ReviewOptionsResponse> get copyWith => __$ReviewOptionsResponseCopyWithImpl<_ReviewOptionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewOptionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewOptionsResponse&&const DeepCollectionEquality().equals(other._reviewOptions, _reviewOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviewOptions));

@override
String toString() {
  return 'ReviewOptionsResponse(reviewOptions: $reviewOptions)';
}


}

/// @nodoc
abstract mixin class _$ReviewOptionsResponseCopyWith<$Res> implements $ReviewOptionsResponseCopyWith<$Res> {
  factory _$ReviewOptionsResponseCopyWith(_ReviewOptionsResponse value, $Res Function(_ReviewOptionsResponse) _then) = __$ReviewOptionsResponseCopyWithImpl;
@override @useResult
$Res call({
 Map<int, List<String>> reviewOptions
});




}
/// @nodoc
class __$ReviewOptionsResponseCopyWithImpl<$Res>
    implements _$ReviewOptionsResponseCopyWith<$Res> {
  __$ReviewOptionsResponseCopyWithImpl(this._self, this._then);

  final _ReviewOptionsResponse _self;
  final $Res Function(_ReviewOptionsResponse) _then;

/// Create a copy of ReviewOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviewOptions = null,}) {
  return _then(_ReviewOptionsResponse(
reviewOptions: null == reviewOptions ? _self._reviewOptions : reviewOptions // ignore: cast_nullable_to_non_nullable
as Map<int, List<String>>,
  ));
}


}

// dart format on
