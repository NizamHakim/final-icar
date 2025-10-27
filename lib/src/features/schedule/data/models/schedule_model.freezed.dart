// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleModel {

 int get id; ScheduleSession get session; DateTime get arrivalTime; int get icarId; int get icarStopId; IcarModel? get icar; IcarStopModel? get icarStop; int? get ticketCount;
/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleModelCopyWith<ScheduleModel> get copyWith => _$ScheduleModelCopyWithImpl<ScheduleModel>(this as ScheduleModel, _$identity);

  /// Serializes this ScheduleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.session, session) || other.session == session)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.icar, icar) || other.icar == icar)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop)&&(identical(other.ticketCount, ticketCount) || other.ticketCount == ticketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,session,arrivalTime,icarId,icarStopId,icar,icarStop,ticketCount);

@override
String toString() {
  return 'ScheduleModel(id: $id, session: $session, arrivalTime: $arrivalTime, icarId: $icarId, icarStopId: $icarStopId, icar: $icar, icarStop: $icarStop, ticketCount: $ticketCount)';
}


}

/// @nodoc
abstract mixin class $ScheduleModelCopyWith<$Res>  {
  factory $ScheduleModelCopyWith(ScheduleModel value, $Res Function(ScheduleModel) _then) = _$ScheduleModelCopyWithImpl;
@useResult
$Res call({
 int id, ScheduleSession session, DateTime arrivalTime, int icarId, int icarStopId, IcarModel? icar, IcarStopModel? icarStop, int? ticketCount
});


$IcarModelCopyWith<$Res>? get icar;$IcarStopModelCopyWith<$Res>? get icarStop;

}
/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._self, this._then);

  final ScheduleModel _self;
  final $Res Function(ScheduleModel) _then;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? session = null,Object? arrivalTime = null,Object? icarId = null,Object? icarStopId = null,Object? icar = freezed,Object? icarStop = freezed,Object? ticketCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as ScheduleSession,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime,icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,icar: freezed == icar ? _self.icar : icar // ignore: cast_nullable_to_non_nullable
as IcarModel?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStopModel?,ticketCount: freezed == ticketCount ? _self.ticketCount : ticketCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarModelCopyWith<$Res>? get icar {
    if (_self.icar == null) {
    return null;
  }

  return $IcarModelCopyWith<$Res>(_self.icar!, (value) {
    return _then(_self.copyWith(icar: value));
  });
}/// Create a copy of ScheduleModel
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

class _ScheduleModel extends ScheduleModel {
  const _ScheduleModel({required this.id, required this.session, required this.arrivalTime, required this.icarId, required this.icarStopId, this.icar, this.icarStop, this.ticketCount}): super._();
  factory _ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);

@override final  int id;
@override final  ScheduleSession session;
@override final  DateTime arrivalTime;
@override final  int icarId;
@override final  int icarStopId;
@override final  IcarModel? icar;
@override final  IcarStopModel? icarStop;
@override final  int? ticketCount;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleModelCopyWith<_ScheduleModel> get copyWith => __$ScheduleModelCopyWithImpl<_ScheduleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.session, session) || other.session == session)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.icar, icar) || other.icar == icar)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop)&&(identical(other.ticketCount, ticketCount) || other.ticketCount == ticketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,session,arrivalTime,icarId,icarStopId,icar,icarStop,ticketCount);

@override
String toString() {
  return 'ScheduleModel(id: $id, session: $session, arrivalTime: $arrivalTime, icarId: $icarId, icarStopId: $icarStopId, icar: $icar, icarStop: $icarStop, ticketCount: $ticketCount)';
}


}

/// @nodoc
abstract mixin class _$ScheduleModelCopyWith<$Res> implements $ScheduleModelCopyWith<$Res> {
  factory _$ScheduleModelCopyWith(_ScheduleModel value, $Res Function(_ScheduleModel) _then) = __$ScheduleModelCopyWithImpl;
@override @useResult
$Res call({
 int id, ScheduleSession session, DateTime arrivalTime, int icarId, int icarStopId, IcarModel? icar, IcarStopModel? icarStop, int? ticketCount
});


@override $IcarModelCopyWith<$Res>? get icar;@override $IcarStopModelCopyWith<$Res>? get icarStop;

}
/// @nodoc
class __$ScheduleModelCopyWithImpl<$Res>
    implements _$ScheduleModelCopyWith<$Res> {
  __$ScheduleModelCopyWithImpl(this._self, this._then);

  final _ScheduleModel _self;
  final $Res Function(_ScheduleModel) _then;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? session = null,Object? arrivalTime = null,Object? icarId = null,Object? icarStopId = null,Object? icar = freezed,Object? icarStop = freezed,Object? ticketCount = freezed,}) {
  return _then(_ScheduleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as ScheduleSession,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime,icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,icar: freezed == icar ? _self.icar : icar // ignore: cast_nullable_to_non_nullable
as IcarModel?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStopModel?,ticketCount: freezed == ticketCount ? _self.ticketCount : ticketCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarModelCopyWith<$Res>? get icar {
    if (_self.icar == null) {
    return null;
  }

  return $IcarModelCopyWith<$Res>(_self.icar!, (value) {
    return _then(_self.copyWith(icar: value));
  });
}/// Create a copy of ScheduleModel
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
