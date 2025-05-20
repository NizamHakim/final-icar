// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IcarStop {

 int get id; String get name; LatLng get coordinate;
/// Create a copy of IcarStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarStopCopyWith<IcarStop> get copyWith => _$IcarStopCopyWithImpl<IcarStop>(this as IcarStop, _$identity);

  /// Serializes this IcarStop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarStop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coordinate, coordinate) || other.coordinate == coordinate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coordinate);

@override
String toString() {
  return 'IcarStop(id: $id, name: $name, coordinate: $coordinate)';
}


}

/// @nodoc
abstract mixin class $IcarStopCopyWith<$Res>  {
  factory $IcarStopCopyWith(IcarStop value, $Res Function(IcarStop) _then) = _$IcarStopCopyWithImpl;
@useResult
$Res call({
 int id, String name, LatLng coordinate
});




}
/// @nodoc
class _$IcarStopCopyWithImpl<$Res>
    implements $IcarStopCopyWith<$Res> {
  _$IcarStopCopyWithImpl(this._self, this._then);

  final IcarStop _self;
  final $Res Function(IcarStop) _then;

/// Create a copy of IcarStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coordinate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coordinate: null == coordinate ? _self.coordinate : coordinate // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IcarStop implements IcarStop {
  const _IcarStop({required this.id, required this.name, required this.coordinate});
  factory _IcarStop.fromJson(Map<String, dynamic> json) => _$IcarStopFromJson(json);

@override final  int id;
@override final  String name;
@override final  LatLng coordinate;

/// Create a copy of IcarStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarStopCopyWith<_IcarStop> get copyWith => __$IcarStopCopyWithImpl<_IcarStop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarStopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarStop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coordinate, coordinate) || other.coordinate == coordinate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coordinate);

@override
String toString() {
  return 'IcarStop(id: $id, name: $name, coordinate: $coordinate)';
}


}

/// @nodoc
abstract mixin class _$IcarStopCopyWith<$Res> implements $IcarStopCopyWith<$Res> {
  factory _$IcarStopCopyWith(_IcarStop value, $Res Function(_IcarStop) _then) = __$IcarStopCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, LatLng coordinate
});




}
/// @nodoc
class __$IcarStopCopyWithImpl<$Res>
    implements _$IcarStopCopyWith<$Res> {
  __$IcarStopCopyWithImpl(this._self, this._then);

  final _IcarStop _self;
  final $Res Function(_IcarStop) _then;

/// Create a copy of IcarStop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coordinate = null,}) {
  return _then(_IcarStop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coordinate: null == coordinate ? _self.coordinate : coordinate // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
