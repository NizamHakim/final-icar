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

 int get id; int get icarRouteId; int get icarStopId; int get order; IcarRoute? get icarRoute; IcarStop? get icarStop;
/// Create a copy of RouteStopWaypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStopWaypointCopyWith<RouteStopWaypoint> get copyWith => _$RouteStopWaypointCopyWithImpl<RouteStopWaypoint>(this as RouteStopWaypoint, _$identity);

  /// Serializes this RouteStopWaypoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteStopWaypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.order, order) || other.order == order)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icarRouteId,icarStopId,order,icarRoute,icarStop);

@override
String toString() {
  return 'RouteStopWaypoint(id: $id, icarRouteId: $icarRouteId, icarStopId: $icarStopId, order: $order, icarRoute: $icarRoute, icarStop: $icarStop)';
}


}

/// @nodoc
abstract mixin class $RouteStopWaypointCopyWith<$Res>  {
  factory $RouteStopWaypointCopyWith(RouteStopWaypoint value, $Res Function(RouteStopWaypoint) _then) = _$RouteStopWaypointCopyWithImpl;
@useResult
$Res call({
 int id, int icarRouteId, int icarStopId, int order, IcarRoute? icarRoute, IcarStop? icarStop
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? icarRouteId = null,Object? icarStopId = null,Object? order = null,Object? icarRoute = freezed,Object? icarStop = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRoute?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStop?,
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
  const _RouteStopWaypoint({required this.id, required this.icarRouteId, required this.icarStopId, required this.order, this.icarRoute, this.icarStop});
  factory _RouteStopWaypoint.fromJson(Map<String, dynamic> json) => _$RouteStopWaypointFromJson(json);

@override final  int id;
@override final  int icarRouteId;
@override final  int icarStopId;
@override final  int order;
@override final  IcarRoute? icarRoute;
@override final  IcarStop? icarStop;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteStopWaypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.order, order) || other.order == order)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icarRouteId,icarStopId,order,icarRoute,icarStop);

@override
String toString() {
  return 'RouteStopWaypoint(id: $id, icarRouteId: $icarRouteId, icarStopId: $icarStopId, order: $order, icarRoute: $icarRoute, icarStop: $icarStop)';
}


}

/// @nodoc
abstract mixin class _$RouteStopWaypointCopyWith<$Res> implements $RouteStopWaypointCopyWith<$Res> {
  factory _$RouteStopWaypointCopyWith(_RouteStopWaypoint value, $Res Function(_RouteStopWaypoint) _then) = __$RouteStopWaypointCopyWithImpl;
@override @useResult
$Res call({
 int id, int icarRouteId, int icarStopId, int order, IcarRoute? icarRoute, IcarStop? icarStop
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? icarRouteId = null,Object? icarStopId = null,Object? order = null,Object? icarRoute = freezed,Object? icarStop = freezed,}) {
  return _then(_RouteStopWaypoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRoute?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStop?,
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
