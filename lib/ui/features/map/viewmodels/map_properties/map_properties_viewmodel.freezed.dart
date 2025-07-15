// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_properties_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteState {

 IcarRoute get route; bool get visible;
/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStateCopyWith<RouteState> get copyWith => _$RouteStateCopyWithImpl<RouteState>(this as RouteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteState&&(identical(other.route, route) || other.route == route)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,route,visible);

@override
String toString() {
  return 'RouteState(route: $route, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $RouteStateCopyWith<$Res>  {
  factory $RouteStateCopyWith(RouteState value, $Res Function(RouteState) _then) = _$RouteStateCopyWithImpl;
@useResult
$Res call({
 IcarRoute route, bool visible
});


$IcarRouteCopyWith<$Res> get route;

}
/// @nodoc
class _$RouteStateCopyWithImpl<$Res>
    implements $RouteStateCopyWith<$Res> {
  _$RouteStateCopyWithImpl(this._self, this._then);

  final RouteState _self;
  final $Res Function(RouteState) _then;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? route = null,Object? visible = null,}) {
  return _then(_self.copyWith(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as IcarRoute,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RouteState
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


class _RouteState implements RouteState {
  const _RouteState({required this.route, required this.visible});
  

@override final  IcarRoute route;
@override final  bool visible;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteStateCopyWith<_RouteState> get copyWith => __$RouteStateCopyWithImpl<_RouteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteState&&(identical(other.route, route) || other.route == route)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,route,visible);

@override
String toString() {
  return 'RouteState(route: $route, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$RouteStateCopyWith<$Res> implements $RouteStateCopyWith<$Res> {
  factory _$RouteStateCopyWith(_RouteState value, $Res Function(_RouteState) _then) = __$RouteStateCopyWithImpl;
@override @useResult
$Res call({
 IcarRoute route, bool visible
});


@override $IcarRouteCopyWith<$Res> get route;

}
/// @nodoc
class __$RouteStateCopyWithImpl<$Res>
    implements _$RouteStateCopyWith<$Res> {
  __$RouteStateCopyWithImpl(this._self, this._then);

  final _RouteState _self;
  final $Res Function(_RouteState) _then;

/// Create a copy of RouteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? route = null,Object? visible = null,}) {
  return _then(_RouteState(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as IcarRoute,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RouteState
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
