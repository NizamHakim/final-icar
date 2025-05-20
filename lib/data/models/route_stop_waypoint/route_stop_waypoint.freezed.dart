// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_stop_waypoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteStopWaypoint {

 int get id; IcarRoute? get icarRoute; IcarStop? get icarStop; int get order;
/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStopWaypointCopyWith<RouteStopWaypoint> get copyWith => _$RouteStopWaypointCopyWithImpl<RouteStopWaypoint>(this as RouteStopWaypoint, _$identity);

  /// Serializes this RouteStopWaypoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteStopWaypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icarRoute,icarStop,order);

@override
String toString() {
  return 'RouteStopWaypoint(id: $id, icarRoute: $icarRoute, icarStop: $icarStop, order: $order)';
}


}

/// @nodoc
abstract mixin class $RouteStopWaypointCopyWith<$Res>  {
  factory $RouteStopWaypointCopyWith(RouteStopWaypoint value, $Res Function(RouteStopWaypoint) _then) = _$RouteStopWaypointCopyWithImpl;
@useResult
$Res call({
 int id, IcarRoute? icarRoute, IcarStop? icarStop, int order
});


$IcarRouteCopyWith<$Res>? get icarRoute;$IcarStopCopyWith<$Res>? get icarStop;

}
/// @nodoc
class _$RouteStopWaypointCopyWithImpl<$Res>
    implements $RouteStopWaypointCopyWith<$Res> {
  _$RouteStopWaypointCopyWithImpl(this._self, this._then);

  final RouteStopWaypoint _self;
  final $Res Function(RouteStopWaypoint) _then;

/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? icarRoute = freezed,Object? icarStop = freezed,Object? order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRoute?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStop?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarRouteCopyWith<$Res>? get icarRoute {
    if (_self.icarRoute == null) {
    return null;
  }

  return $IcarRouteCopyWith<$Res>(_self.icarRoute!, (value) {
    return _then(_self.copyWith(icarRoute: value));
  });
}/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarStopCopyWith<$Res>? get icarStop {
    if (_self.icarStop == null) {
    return null;
  }

  return $IcarStopCopyWith<$Res>(_self.icarStop!, (value) {
    return _then(_self.copyWith(icarStop: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RouteStopWaypoint implements RouteStopWaypoint {
  const _RouteStopWaypoint({required this.id, required this.icarRoute, required this.icarStop, required this.order});
  factory _RouteStopWaypoint.fromJson(Map<String, dynamic> json) => _$RouteStopWaypointFromJson(json);

@override final  int id;
@override final  IcarRoute? icarRoute;
@override final  IcarStop? icarStop;
@override final  int order;

/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteStopWaypointCopyWith<_RouteStopWaypoint> get copyWith => __$RouteStopWaypointCopyWithImpl<_RouteStopWaypoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteStopWaypointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteStopWaypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icarRoute,icarStop,order);

@override
String toString() {
  return 'RouteStopWaypoint(id: $id, icarRoute: $icarRoute, icarStop: $icarStop, order: $order)';
}


}

/// @nodoc
abstract mixin class _$RouteStopWaypointCopyWith<$Res> implements $RouteStopWaypointCopyWith<$Res> {
  factory _$RouteStopWaypointCopyWith(_RouteStopWaypoint value, $Res Function(_RouteStopWaypoint) _then) = __$RouteStopWaypointCopyWithImpl;
@override @useResult
$Res call({
 int id, IcarRoute? icarRoute, IcarStop? icarStop, int order
});


@override $IcarRouteCopyWith<$Res>? get icarRoute;@override $IcarStopCopyWith<$Res>? get icarStop;

}
/// @nodoc
class __$RouteStopWaypointCopyWithImpl<$Res>
    implements _$RouteStopWaypointCopyWith<$Res> {
  __$RouteStopWaypointCopyWithImpl(this._self, this._then);

  final _RouteStopWaypoint _self;
  final $Res Function(_RouteStopWaypoint) _then;

/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? icarRoute = freezed,Object? icarStop = freezed,Object? order = null,}) {
  return _then(_RouteStopWaypoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRoute?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStop?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarRouteCopyWith<$Res>? get icarRoute {
    if (_self.icarRoute == null) {
    return null;
  }

  return $IcarRouteCopyWith<$Res>(_self.icarRoute!, (value) {
    return _then(_self.copyWith(icarRoute: value));
  });
}/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarStopCopyWith<$Res>? get icarStop {
    if (_self.icarStop == null) {
    return null;
  }

  return $IcarStopCopyWith<$Res>(_self.icarStop!, (value) {
    return _then(_self.copyWith(icarStop: value));
  });
}
}

// dart format on
