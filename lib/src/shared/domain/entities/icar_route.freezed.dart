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

 int get id; String get name;@JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color get color; List<Icar>? get icars; List<RouteStopWaypoint>? get routeStopWaypoints;@JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson) List<LatLng>? get polylinePoints;
/// Create a copy of IcarRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarRouteCopyWith<IcarRoute> get copyWith => _$IcarRouteCopyWithImpl<IcarRoute>(this as IcarRoute, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.icars, icars)&&const DeepCollectionEquality().equals(other.routeStopWaypoints, routeStopWaypoints)&&const DeepCollectionEquality().equals(other.polylinePoints, polylinePoints));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,color,const DeepCollectionEquality().hash(icars),const DeepCollectionEquality().hash(routeStopWaypoints),const DeepCollectionEquality().hash(polylinePoints));

@override
String toString() {
  return 'IcarRoute(id: $id, name: $name, color: $color, icars: $icars, routeStopWaypoints: $routeStopWaypoints, polylinePoints: $polylinePoints)';
}


}

/// @nodoc
abstract mixin class $IcarRouteCopyWith<$Res>  {
  factory $IcarRouteCopyWith(IcarRoute value, $Res Function(IcarRoute) _then) = _$IcarRouteCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color color, List<Icar>? icars, List<RouteStopWaypoint>? routeStopWaypoints,@JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson) List<LatLng>? polylinePoints
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = null,Object? icars = freezed,Object? routeStopWaypoints = freezed,Object? polylinePoints = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,icars: freezed == icars ? _self.icars : icars // ignore: cast_nullable_to_non_nullable
as List<Icar>?,routeStopWaypoints: freezed == routeStopWaypoints ? _self.routeStopWaypoints : routeStopWaypoints // ignore: cast_nullable_to_non_nullable
as List<RouteStopWaypoint>?,polylinePoints: freezed == polylinePoints ? _self.polylinePoints : polylinePoints // ignore: cast_nullable_to_non_nullable
as List<LatLng>?,
  ));
}

}


/// @nodoc


class _IcarRoute extends IcarRoute {
  const _IcarRoute({required this.id, required this.name, @JsonKey(fromJson: colorFromJson, toJson: colorToJson) required this.color, final  List<Icar>? icars, final  List<RouteStopWaypoint>? routeStopWaypoints, @JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson) final  List<LatLng>? polylinePoints}): _icars = icars,_routeStopWaypoints = routeStopWaypoints,_polylinePoints = polylinePoints,super._();
  

@override final  int id;
@override final  String name;
@override@JsonKey(fromJson: colorFromJson, toJson: colorToJson) final  Color color;
 final  List<Icar>? _icars;
@override List<Icar>? get icars {
  final value = _icars;
  if (value == null) return null;
  if (_icars is EqualUnmodifiableListView) return _icars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RouteStopWaypoint>? _routeStopWaypoints;
@override List<RouteStopWaypoint>? get routeStopWaypoints {
  final value = _routeStopWaypoints;
  if (value == null) return null;
  if (_routeStopWaypoints is EqualUnmodifiableListView) return _routeStopWaypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<LatLng>? _polylinePoints;
@override@JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson) List<LatLng>? get polylinePoints {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._icars, _icars)&&const DeepCollectionEquality().equals(other._routeStopWaypoints, _routeStopWaypoints)&&const DeepCollectionEquality().equals(other._polylinePoints, _polylinePoints));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,color,const DeepCollectionEquality().hash(_icars),const DeepCollectionEquality().hash(_routeStopWaypoints),const DeepCollectionEquality().hash(_polylinePoints));

@override
String toString() {
  return 'IcarRoute(id: $id, name: $name, color: $color, icars: $icars, routeStopWaypoints: $routeStopWaypoints, polylinePoints: $polylinePoints)';
}


}

/// @nodoc
abstract mixin class _$IcarRouteCopyWith<$Res> implements $IcarRouteCopyWith<$Res> {
  factory _$IcarRouteCopyWith(_IcarRoute value, $Res Function(_IcarRoute) _then) = __$IcarRouteCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color color, List<Icar>? icars, List<RouteStopWaypoint>? routeStopWaypoints,@JsonKey(fromJson: listLatLngFromJson, toJson: listLatLngToJson) List<LatLng>? polylinePoints
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = null,Object? icars = freezed,Object? routeStopWaypoints = freezed,Object? polylinePoints = freezed,}) {
  return _then(_IcarRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,icars: freezed == icars ? _self._icars : icars // ignore: cast_nullable_to_non_nullable
as List<Icar>?,routeStopWaypoints: freezed == routeStopWaypoints ? _self._routeStopWaypoints : routeStopWaypoints // ignore: cast_nullable_to_non_nullable
as List<RouteStopWaypoint>?,polylinePoints: freezed == polylinePoints ? _self._polylinePoints : polylinePoints // ignore: cast_nullable_to_non_nullable
as List<LatLng>?,
  ));
}


}

// dart format on
