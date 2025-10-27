// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IcarModel {

 int get id; String get name; int get capacity; IcarStatus get status; int get icarRouteId; IcarRouteModel? get icarRoute; List<ScheduleModel>? get schedules;
/// Create a copy of IcarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarModelCopyWith<IcarModel> get copyWith => _$IcarModelCopyWithImpl<IcarModel>(this as IcarModel, _$identity);

  /// Serializes this IcarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&const DeepCollectionEquality().equals(other.schedules, schedules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,capacity,status,icarRouteId,icarRoute,const DeepCollectionEquality().hash(schedules));

@override
String toString() {
  return 'IcarModel(id: $id, name: $name, capacity: $capacity, status: $status, icarRouteId: $icarRouteId, icarRoute: $icarRoute, schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class $IcarModelCopyWith<$Res>  {
  factory $IcarModelCopyWith(IcarModel value, $Res Function(IcarModel) _then) = _$IcarModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, int capacity, IcarStatus status, int icarRouteId, IcarRouteModel? icarRoute, List<ScheduleModel>? schedules
});


$IcarRouteModelCopyWith<$Res>? get icarRoute;

}
/// @nodoc
class _$IcarModelCopyWithImpl<$Res>
    implements $IcarModelCopyWith<$Res> {
  _$IcarModelCopyWithImpl(this._self, this._then);

  final IcarModel _self;
  final $Res Function(IcarModel) _then;

/// Create a copy of IcarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? capacity = null,Object? status = null,Object? icarRouteId = null,Object? icarRoute = freezed,Object? schedules = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IcarStatus,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRouteModel?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleModel>?,
  ));
}
/// Create a copy of IcarModel
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
}
}


/// @nodoc
@JsonSerializable()

class _IcarModel extends IcarModel {
  const _IcarModel({required this.id, required this.name, required this.capacity, required this.status, required this.icarRouteId, this.icarRoute, final  List<ScheduleModel>? schedules}): _schedules = schedules,super._();
  factory _IcarModel.fromJson(Map<String, dynamic> json) => _$IcarModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  int capacity;
@override final  IcarStatus status;
@override final  int icarRouteId;
@override final  IcarRouteModel? icarRoute;
 final  List<ScheduleModel>? _schedules;
@override List<ScheduleModel>? get schedules {
  final value = _schedules;
  if (value == null) return null;
  if (_schedules is EqualUnmodifiableListView) return _schedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of IcarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarModelCopyWith<_IcarModel> get copyWith => __$IcarModelCopyWithImpl<_IcarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.icarRouteId, icarRouteId) || other.icarRouteId == icarRouteId)&&(identical(other.icarRoute, icarRoute) || other.icarRoute == icarRoute)&&const DeepCollectionEquality().equals(other._schedules, _schedules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,capacity,status,icarRouteId,icarRoute,const DeepCollectionEquality().hash(_schedules));

@override
String toString() {
  return 'IcarModel(id: $id, name: $name, capacity: $capacity, status: $status, icarRouteId: $icarRouteId, icarRoute: $icarRoute, schedules: $schedules)';
}


}

/// @nodoc
abstract mixin class _$IcarModelCopyWith<$Res> implements $IcarModelCopyWith<$Res> {
  factory _$IcarModelCopyWith(_IcarModel value, $Res Function(_IcarModel) _then) = __$IcarModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int capacity, IcarStatus status, int icarRouteId, IcarRouteModel? icarRoute, List<ScheduleModel>? schedules
});


@override $IcarRouteModelCopyWith<$Res>? get icarRoute;

}
/// @nodoc
class __$IcarModelCopyWithImpl<$Res>
    implements _$IcarModelCopyWith<$Res> {
  __$IcarModelCopyWithImpl(this._self, this._then);

  final _IcarModel _self;
  final $Res Function(_IcarModel) _then;

/// Create a copy of IcarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? capacity = null,Object? status = null,Object? icarRouteId = null,Object? icarRoute = freezed,Object? schedules = freezed,}) {
  return _then(_IcarModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IcarStatus,icarRouteId: null == icarRouteId ? _self.icarRouteId : icarRouteId // ignore: cast_nullable_to_non_nullable
as int,icarRoute: freezed == icarRoute ? _self.icarRoute : icarRoute // ignore: cast_nullable_to_non_nullable
as IcarRouteModel?,schedules: freezed == schedules ? _self._schedules : schedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleModel>?,
  ));
}

/// Create a copy of IcarModel
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
}
}

// dart format on
