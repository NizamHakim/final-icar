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

 int get id; String get name; LatLng get coordinate; int? get distance; List<RouteStopWaypoint>? get routeStopWaypoints; List<Schedule>? get schedules; Duration? get duration;
/// Create a copy of IcarStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarStopCopyWith<IcarStop> get copyWith => _$IcarStopCopyWithImpl<IcarStop>(this as IcarStop, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarStop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coordinate, coordinate) || other.coordinate == coordinate)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other.routeStopWaypoints, routeStopWaypoints)&&const DeepCollectionEquality().equals(other.schedules, schedules)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,coordinate,distance,const DeepCollectionEquality().hash(routeStopWaypoints),const DeepCollectionEquality().hash(schedules),duration);

@override
String toString() {
  return 'IcarStop(id: $id, name: $name, coordinate: $coordinate, distance: $distance, routeStopWaypoints: $routeStopWaypoints, schedules: $schedules, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $IcarStopCopyWith<$Res>  {
  factory $IcarStopCopyWith(IcarStop value, $Res Function(IcarStop) _then) = _$IcarStopCopyWithImpl;
@useResult
$Res call({
 int id, String name, LatLng coordinate, int? distance, List<RouteStopWaypoint>? routeStopWaypoints, List<Schedule>? schedules, Duration? duration
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coordinate = null,Object? distance = freezed,Object? routeStopWaypoints = freezed,Object? schedules = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coordinate: null == coordinate ? _self.coordinate : coordinate // ignore: cast_nullable_to_non_nullable
as LatLng,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,routeStopWaypoints: freezed == routeStopWaypoints ? _self.routeStopWaypoints : routeStopWaypoints // ignore: cast_nullable_to_non_nullable
as List<RouteStopWaypoint>?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<Schedule>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// @nodoc


class _IcarStop implements IcarStop {
  const _IcarStop({required this.id, required this.name, required this.coordinate, this.distance, final  List<RouteStopWaypoint>? routeStopWaypoints, final  List<Schedule>? schedules, this.duration}): _routeStopWaypoints = routeStopWaypoints,_schedules = schedules;
  

@override final  int id;
@override final  String name;
@override final  LatLng coordinate;
@override final  int? distance;
 final  List<RouteStopWaypoint>? _routeStopWaypoints;
@override List<RouteStopWaypoint>? get routeStopWaypoints {
  final value = _routeStopWaypoints;
  if (value == null) return null;
  if (_routeStopWaypoints is EqualUnmodifiableListView) return _routeStopWaypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Schedule>? _schedules;
@override List<Schedule>? get schedules {
  final value = _schedules;
  if (value == null) return null;
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Duration? duration;

/// Create a copy of IcarStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarStopCopyWith<_IcarStop> get copyWith => __$IcarStopCopyWithImpl<_IcarStop>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarStop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coordinate, coordinate) || other.coordinate == coordinate)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other._routeStopWaypoints, _routeStopWaypoints)&&const DeepCollectionEquality().equals(other._schedules, _schedules)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,coordinate,distance,const DeepCollectionEquality().hash(_routeStopWaypoints),const DeepCollectionEquality().hash(_schedules),duration);

@override
String toString() {
  return 'IcarStop(id: $id, name: $name, coordinate: $coordinate, distance: $distance, routeStopWaypoints: $routeStopWaypoints, schedules: $schedules, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$IcarStopCopyWith<$Res> implements $IcarStopCopyWith<$Res> {
  factory _$IcarStopCopyWith(_IcarStop value, $Res Function(_IcarStop) _then) = __$IcarStopCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, LatLng coordinate, int? distance, List<RouteStopWaypoint>? routeStopWaypoints, List<Schedule>? schedules, Duration? duration
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coordinate = null,Object? distance = freezed,Object? routeStopWaypoints = freezed,Object? schedules = freezed,Object? duration = freezed,}) {
  return _then(_IcarStop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coordinate: null == coordinate ? _self.coordinate : coordinate // ignore: cast_nullable_to_non_nullable
as LatLng,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,routeStopWaypoints: freezed == routeStopWaypoints ? _self._routeStopWaypoints : routeStopWaypoints // ignore: cast_nullable_to_non_nullable
as List<RouteStopWaypoint>?,schedules: freezed == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<Schedule>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
