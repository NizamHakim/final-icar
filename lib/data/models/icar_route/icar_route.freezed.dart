// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IcarRoute {

 int get id; String get name;@JsonKey(name: "hexColor", fromJson: _colorFromJson, toJson: _colorToJson) Color get color; List<LatLng>? get polylinePoints;
/// Create a copy of IcarRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarRouteCopyWith<IcarRoute> get copyWith => _$IcarRouteCopyWithImpl<IcarRoute>(this as IcarRoute, _$identity);

  /// Serializes this IcarRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.polylinePoints, polylinePoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,const DeepCollectionEquality().hash(polylinePoints));

@override
String toString() {
  return 'IcarRoute(id: $id, name: $name, color: $color, polylinePoints: $polylinePoints)';
}


}

/// @nodoc
abstract mixin class $IcarRouteCopyWith<$Res>  {
  factory $IcarRouteCopyWith(IcarRoute value, $Res Function(IcarRoute) _then) = _$IcarRouteCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: "hexColor", fromJson: _colorFromJson, toJson: _colorToJson) Color color, List<LatLng>? polylinePoints
});




}
/// @nodoc
class _$IcarRouteCopyWithImpl<$Res>
    implements $IcarRouteCopyWith<$Res> {
  _$IcarRouteCopyWithImpl(this._self, this._then);

  final IcarRoute _self;
  final $Res Function(IcarRoute) _then;

/// Create a copy of IcarRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = null,Object? polylinePoints = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,polylinePoints: freezed == polylinePoints ? _self.polylinePoints : polylinePoints // ignore: cast_nullable_to_non_nullable
as List<LatLng>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IcarRoute implements IcarRoute {
  const _IcarRoute({required this.id, required this.name, @JsonKey(name: "hexColor", fromJson: _colorFromJson, toJson: _colorToJson) required this.color, final  List<LatLng>? polylinePoints}): _polylinePoints = polylinePoints;
  factory _IcarRoute.fromJson(Map<String, dynamic> json) => _$IcarRouteFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: "hexColor", fromJson: _colorFromJson, toJson: _colorToJson) final  Color color;
 final  List<LatLng>? _polylinePoints;
@override List<LatLng>? get polylinePoints {
  final value = _polylinePoints;
  if (value == null) return null;
  if (_polylinePoints is EqualUnmodifiableListView) return _polylinePoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of IcarRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarRouteCopyWith<_IcarRoute> get copyWith => __$IcarRouteCopyWithImpl<_IcarRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._polylinePoints, _polylinePoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,const DeepCollectionEquality().hash(_polylinePoints));

@override
String toString() {
  return 'IcarRoute(id: $id, name: $name, color: $color, polylinePoints: $polylinePoints)';
}


}

/// @nodoc
abstract mixin class _$IcarRouteCopyWith<$Res> implements $IcarRouteCopyWith<$Res> {
  factory _$IcarRouteCopyWith(_IcarRoute value, $Res Function(_IcarRoute) _then) = __$IcarRouteCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: "hexColor", fromJson: _colorFromJson, toJson: _colorToJson) Color color, List<LatLng>? polylinePoints
});




}
/// @nodoc
class __$IcarRouteCopyWithImpl<$Res>
    implements _$IcarRouteCopyWith<$Res> {
  __$IcarRouteCopyWithImpl(this._self, this._then);

  final _IcarRoute _self;
  final $Res Function(_IcarRoute) _then;

/// Create a copy of IcarRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = null,Object? polylinePoints = freezed,}) {
  return _then(_IcarRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,polylinePoints: freezed == polylinePoints ? _self._polylinePoints : polylinePoints // ignore: cast_nullable_to_non_nullable
as List<LatLng>?,
  ));
}


}

// dart format on
