// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_stop_waypoint_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteStopWaypointModel {

 int get id; int get icarRouteId; int get icarStopId; int get order;// optional
 IcarRouteModel? get icarRoute; IcarStopModel? get icarStop;
/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStopWaypointModelCopyWith<RouteStopWaypointModel> get copyWith => _$RouteStopWaypointModelCopyWithImpl<RouteStopWaypointModel>(this as RouteStopWaypointModel, _$identity);

  /// Serializes this RouteStopWaypointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteStopWaypointModel&&(identical(other.id, id) || other.id == id)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.order, order) || other.order == order)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icarRouteId,icarStopId,order,icarRoute,icarStop);

@override
String toString() {
  return 'RouteStopWaypointModel(id: $id, icarRouteId: $icarRouteId, icarStopId: $icarStopId, order: $order, icarRoute: $icarRoute, icarStop: $icarStop)';
}


}

/// @nodoc
abstract mixin class $RouteStopWaypointModelCopyWith<$Res>  {
  factory $RouteStopWaypointModelCopyWith(RouteStopWaypointModel value, $Res Function(RouteStopWaypointModel) _then) = _$RouteStopWaypointModelCopyWithImpl;
@useResult
$Res call({
 int id, int icarRouteId, int icarStopId, int order, IcarRouteModel? icarRoute, IcarStopModel? icarStop
});


$IcarRouteModelCopyWith<$Res>? get icarRoute;$IcarStopModelCopyWith<$Res>? get icarStop;

}
/// @nodoc
class _$RouteStopWaypointModelCopyWithImpl<$Res>
    implements $RouteStopWaypointModelCopyWith<$Res> {
  _$RouteStopWaypointModelCopyWithImpl(this._self, this._then);

  final RouteStopWaypointModel _self;
  final $Res Function(RouteStopWaypointModel) _then;

/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? icarRouteId = null,Object? icarStopId = null,Object? order = null,Object? icarRoute = freezed,Object? icarStop = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRouteModel?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStopModel?,
  ));
}
/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarRouteModelCopyWith<$Res>? get icarRoute {
    if (_self.icarRoute == null) {
    return null;
  }

  return $IcarRouteModelCopyWith<$Res>(_self.icarRoute!, (value) {
    return _then(_self.copyWith(icarRoute: value));
  });
}/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarStopModelCopyWith<$Res>? get icarStop {
    if (_self.icarStop == null) {
    return null;
  }

  return $IcarStopModelCopyWith<$Res>(_self.icarStop!, (value) {
    return _then(_self.copyWith(icarStop: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RouteStopWaypointModel extends RouteStopWaypointModel {
  const _RouteStopWaypointModel({required this.id, required this.icarRouteId, required this.icarStopId, required this.order, this.icarRoute, this.icarStop}): super._();
  factory _RouteStopWaypointModel.fromJson(Map<String, dynamic> json) => _$RouteStopWaypointModelFromJson(json);

@override final  int id;
@override final  int icarRouteId;
@override final  int icarStopId;
@override final  int order;
// optional
@override final  IcarRouteModel? icarRoute;
@override final  IcarStopModel? icarStop;

/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteStopWaypointModelCopyWith<_RouteStopWaypointModel> get copyWith => __$RouteStopWaypointModelCopyWithImpl<_RouteStopWaypointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteStopWaypointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteStopWaypointModel&&(identical(other.id, id) || other.id == id)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.order, order) || other.order == order)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,icarRouteId,icarStopId,order,icarRoute,icarStop);

@override
String toString() {
  return 'RouteStopWaypointModel(id: $id, icarRouteId: $icarRouteId, icarStopId: $icarStopId, order: $order, icarRoute: $icarRoute, icarStop: $icarStop)';
}


}

/// @nodoc
abstract mixin class _$RouteStopWaypointModelCopyWith<$Res> implements $RouteStopWaypointModelCopyWith<$Res> {
  factory _$RouteStopWaypointModelCopyWith(_RouteStopWaypointModel value, $Res Function(_RouteStopWaypointModel) _then) = __$RouteStopWaypointModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int icarRouteId, int icarStopId, int order, IcarRouteModel? icarRoute, IcarStopModel? icarStop
});


@override $IcarRouteModelCopyWith<$Res>? get icarRoute;@override $IcarStopModelCopyWith<$Res>? get icarStop;

}
/// @nodoc
class __$RouteStopWaypointModelCopyWithImpl<$Res>
    implements _$RouteStopWaypointModelCopyWith<$Res> {
  __$RouteStopWaypointModelCopyWithImpl(this._self, this._then);

  final _RouteStopWaypointModel _self;
  final $Res Function(_RouteStopWaypointModel) _then;

/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? icarRouteId = null,Object? icarStopId = null,Object? order = null,Object? icarRoute = freezed,Object? icarStop = freezed,}) {
  return _then(_RouteStopWaypointModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRouteModel?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStopModel?,
  ));
}

/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarRouteModelCopyWith<$Res>? get icarRoute {
    if (_self.icarRoute == null) {
    return null;
  }

  return $IcarRouteModelCopyWith<$Res>(_self.icarRoute!, (value) {
    return _then(_self.copyWith(icarRoute: value));
  });
}/// Create a copy of RouteStopWaypointModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarStopModelCopyWith<$Res>? get icarStop {
    if (_self.icarStop == null) {
    return null;
  }

  return $IcarStopModelCopyWith<$Res>(_self.icarStop!, (value) {
    return _then(_self.copyWith(icarStop: value));
  });
}
}

// dart format on
