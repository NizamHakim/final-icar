// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_visibility_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteVisibilityState {

 IcarRoute get route; bool get visible;
/// Create a copy of RouteVisibilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteVisibilityStateCopyWith<RouteVisibilityState> get copyWith => _$RouteVisibilityStateCopyWithImpl<RouteVisibilityState>(this as RouteVisibilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteVisibilityState&&(identical(other.route, route) || other.route == route)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,route,visible);

@override
String toString() {
  return 'RouteVisibilityState(route: $route, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $RouteVisibilityStateCopyWith<$Res>  {
  factory $RouteVisibilityStateCopyWith(RouteVisibilityState value, $Res Function(RouteVisibilityState) _then) = _$RouteVisibilityStateCopyWithImpl;
@useResult
$Res call({
 IcarRoute route, bool visible
});


$IcarRouteCopyWith<$Res> get route;

}
/// @nodoc
class _$RouteVisibilityStateCopyWithImpl<$Res>
    implements $RouteVisibilityStateCopyWith<$Res> {
  _$RouteVisibilityStateCopyWithImpl(this._self, this._then);

  final RouteVisibilityState _self;
  final $Res Function(RouteVisibilityState) _then;

/// Create a copy of RouteVisibilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? route = null,Object? visible = null,}) {
  return _then(_self.copyWith(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as IcarRoute,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RouteVisibilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarRouteCopyWith<$Res> get route {
  
  return $IcarRouteCopyWith<$Res>(_self.route, (value) {
    return _then(_self.copyWith(route: value));
  });
}
}


/// @nodoc


class _RouteVisibilityState implements RouteVisibilityState {
  const _RouteVisibilityState({required this.route, required this.visible});
  

@override final  IcarRoute route;
@override final  bool visible;

/// Create a copy of RouteVisibilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteVisibilityStateCopyWith<_RouteVisibilityState> get copyWith => __$RouteVisibilityStateCopyWithImpl<_RouteVisibilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteVisibilityState&&(identical(other.route, route) || other.route == route)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,route,visible);

@override
String toString() {
  return 'RouteVisibilityState(route: $route, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$RouteVisibilityStateCopyWith<$Res> implements $RouteVisibilityStateCopyWith<$Res> {
  factory _$RouteVisibilityStateCopyWith(_RouteVisibilityState value, $Res Function(_RouteVisibilityState) _then) = __$RouteVisibilityStateCopyWithImpl;
@override @useResult
$Res call({
 IcarRoute route, bool visible
});


@override $IcarRouteCopyWith<$Res> get route;

}
/// @nodoc
class __$RouteVisibilityStateCopyWithImpl<$Res>
    implements _$RouteVisibilityStateCopyWith<$Res> {
  __$RouteVisibilityStateCopyWithImpl(this._self, this._then);

  final _RouteVisibilityState _self;
  final $Res Function(_RouteVisibilityState) _then;

/// Create a copy of RouteVisibilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? route = null,Object? visible = null,}) {
  return _then(_RouteVisibilityState(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as IcarRoute,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RouteVisibilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarRouteCopyWith<$Res> get route {
  
  return $IcarRouteCopyWith<$Res>(_self.route, (value) {
    return _then(_self.copyWith(route: value));
  });
}
}

// dart format on
