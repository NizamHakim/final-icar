// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Icar {

 int get id; String get name; int get capacity; IcarStatus get status; int get icarRouteId; IcarRoute? get icarRoute; List<Schedule>? get schedules;
/// Create a copy of Icar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarCopyWith<Icar> get copyWith => _$IcarCopyWithImpl<Icar>(this as Icar, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Icar&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&const DeepCollectionEquality().equals(other.schedules, schedules));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,capacity,status,icarRouteId,icarRoute,const DeepCollectionEquality().hash(schedules));

@override
String toString() {
  return 'Icar(id: $id, name: $name, capacity: $capacity, status: $status, icarRouteId: $icarRouteId, icarRoute: $icarRoute, schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class $IcarCopyWith<$Res>  {
  factory $IcarCopyWith(Icar value, $Res Function(Icar) _then) = _$IcarCopyWithImpl;
@useResult
$Res call({
 int id, String name, int capacity, IcarStatus status, int icarRouteId, IcarRoute? icarRoute, List<Schedule>? schedules
});


$IcarRouteCopyWith<$Res>? get icarRoute;

}
/// @nodoc
class _$IcarCopyWithImpl<$Res>
    implements $IcarCopyWith<$Res> {
  _$IcarCopyWithImpl(this._self, this._then);

  final Icar _self;
  final $Res Function(Icar) _then;

/// Create a copy of Icar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? capacity = null,Object? status = null,Object? icarRouteId = null,Object? icarRoute = freezed,Object? schedules = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IcarStatus,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRoute?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<Schedule>?,
  ));
}
/// Create a copy of Icar
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
}
}


/// @nodoc


class _Icar extends Icar {
  const _Icar({required this.id, required this.name, required this.capacity, required this.status, required this.icarRouteId, this.icarRoute, final  List<Schedule>? schedules}): _schedules = schedules,super._();
  

@override final  int id;
@override final  String name;
@override final  int capacity;
@override final  IcarStatus status;
@override final  int icarRouteId;
@override final  IcarRoute? icarRoute;
 final  List<Schedule>? _schedules;
@override List<Schedule>? get schedules {
  final value = _schedules;
  if (value == null) return null;
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Icar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarCopyWith<_Icar> get copyWith => __$IcarCopyWithImpl<_Icar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Icar&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&const DeepCollectionEquality().equals(other._schedules, _schedules));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,capacity,status,icarRouteId,icarRoute,const DeepCollectionEquality().hash(_schedules));

@override
String toString() {
  return 'Icar(id: $id, name: $name, capacity: $capacity, status: $status, icarRouteId: $icarRouteId, icarRoute: $icarRoute, schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class _$IcarCopyWith<$Res> implements $IcarCopyWith<$Res> {
  factory _$IcarCopyWith(_Icar value, $Res Function(_Icar) _then) = __$IcarCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int capacity, IcarStatus status, int icarRouteId, IcarRoute? icarRoute, List<Schedule>? schedules
});


@override $IcarRouteCopyWith<$Res>? get icarRoute;

}
/// @nodoc
class __$IcarCopyWithImpl<$Res>
    implements _$IcarCopyWith<$Res> {
  __$IcarCopyWithImpl(this._self, this._then);

  final _Icar _self;
  final $Res Function(_Icar) _then;

/// Create a copy of Icar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? capacity = null,Object? status = null,Object? icarRouteId = null,Object? icarRoute = freezed,Object? schedules = freezed,}) {
  return _then(_Icar(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IcarStatus,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRoute?,schedules: freezed == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<Schedule>?,
  ));
}

/// Create a copy of Icar
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
}
}

// dart format on
