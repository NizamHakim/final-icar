// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_stop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IcarStopModel {

 int get id; String get name;@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng get coordinate;// optional
 int? get distance; List<RouteStopWaypointModel>? get routeStopWaypoints; List<ScheduleModel>? get schedules;@JsonKey(fromJson: durationFromJson, toJson: durationToJson) Duration? get duration;
/// Create a copy of IcarStopModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarStopModelCopyWith<IcarStopModel> get copyWith => _$IcarStopModelCopyWithImpl<IcarStopModel>(this as IcarStopModel, _$identity);

  /// Serializes this IcarStopModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarStopModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coordinate, coordinate) || other.coordinate == coordinate)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other.routeStopWaypoints, routeStopWaypoints)&&const DeepCollectionEquality().equals(other.schedules, schedules)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coordinate,distance,const DeepCollectionEquality().hash(routeStopWaypoints),const DeepCollectionEquality().hash(schedules),duration);

@override
String toString() {
  return 'IcarStopModel(id: $id, name: $name, coordinate: $coordinate, distance: $distance, routeStopWaypoints: $routeStopWaypoints, schedules: $schedules, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $IcarStopModelCopyWith<$Res>  {
  factory $IcarStopModelCopyWith(IcarStopModel value, $Res Function(IcarStopModel) _then) = _$IcarStopModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng coordinate, int? distance, List<RouteStopWaypointModel>? routeStopWaypoints, List<ScheduleModel>? schedules,@JsonKey(fromJson: durationFromJson, toJson: durationToJson) Duration? duration
});




}
/// @nodoc
class _$IcarStopModelCopyWithImpl<$Res>
    implements $IcarStopModelCopyWith<$Res> {
  _$IcarStopModelCopyWithImpl(this._self, this._then);

  final IcarStopModel _self;
  final $Res Function(IcarStopModel) _then;

/// Create a copy of IcarStopModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coordinate = null,Object? distance = freezed,Object? routeStopWaypoints = freezed,Object? schedules = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coordinate: null == coordinate ? _self.coordinate : coordinate // ignore: cast_nullable_to_non_nullable
as LatLng,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,routeStopWaypoints: freezed == routeStopWaypoints ? _self.routeStopWaypoints : routeStopWaypoints // ignore: cast_nullable_to_non_nullable
as List<RouteStopWaypointModel>?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleModel>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IcarStopModel extends IcarStopModel {
  const _IcarStopModel({required this.id, required this.name, @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) required this.coordinate, this.distance, final  List<RouteStopWaypointModel>? routeStopWaypoints, final  List<ScheduleModel>? schedules, @JsonKey(fromJson: durationFromJson, toJson: durationToJson) this.duration}): _routeStopWaypoints = routeStopWaypoints,_schedules = schedules,super._();
  factory _IcarStopModel.fromJson(Map<String, dynamic> json) => _$IcarStopModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) final  LatLng coordinate;
// optional
@override final  int? distance;
 final  List<RouteStopWaypointModel>? _routeStopWaypoints;
@override List<RouteStopWaypointModel>? get routeStopWaypoints {
  final value = _routeStopWaypoints;
  if (value == null) return null;
  if (_routeStopWaypoints is EqualUnmodifiableListView) return _routeStopWaypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ScheduleModel>? _schedules;
@override List<ScheduleModel>? get schedules {
  final value = _schedules;
  if (value == null) return null;
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: durationFromJson, toJson: durationToJson) final  Duration? duration;

/// Create a copy of IcarStopModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarStopModelCopyWith<_IcarStopModel> get copyWith => __$IcarStopModelCopyWithImpl<_IcarStopModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarStopModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarStopModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coordinate, coordinate) || other.coordinate == coordinate)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other._routeStopWaypoints, _routeStopWaypoints)&&const DeepCollectionEquality().equals(other._schedules, _schedules)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coordinate,distance,const DeepCollectionEquality().hash(_routeStopWaypoints),const DeepCollectionEquality().hash(_schedules),duration);

@override
String toString() {
  return 'IcarStopModel(id: $id, name: $name, coordinate: $coordinate, distance: $distance, routeStopWaypoints: $routeStopWaypoints, schedules: $schedules, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$IcarStopModelCopyWith<$Res> implements $IcarStopModelCopyWith<$Res> {
  factory _$IcarStopModelCopyWith(_IcarStopModel value, $Res Function(_IcarStopModel) _then) = __$IcarStopModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng coordinate, int? distance, List<RouteStopWaypointModel>? routeStopWaypoints, List<ScheduleModel>? schedules,@JsonKey(fromJson: durationFromJson, toJson: durationToJson) Duration? duration
});




}
/// @nodoc
class __$IcarStopModelCopyWithImpl<$Res>
    implements _$IcarStopModelCopyWith<$Res> {
  __$IcarStopModelCopyWithImpl(this._self, this._then);

  final _IcarStopModel _self;
  final $Res Function(_IcarStopModel) _then;

/// Create a copy of IcarStopModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coordinate = null,Object? distance = freezed,Object? routeStopWaypoints = freezed,Object? schedules = freezed,Object? duration = freezed,}) {
  return _then(_IcarStopModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coordinate: null == coordinate ? _self.coordinate : coordinate // ignore: cast_nullable_to_non_nullable
as LatLng,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,routeStopWaypoints: freezed == routeStopWaypoints ? _self._routeStopWaypoints : routeStopWaypoints // ignore: cast_nullable_to_non_nullable
as List<RouteStopWaypointModel>?,schedules: freezed == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleModel>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
