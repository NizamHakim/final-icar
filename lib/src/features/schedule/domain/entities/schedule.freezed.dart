// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Schedule {

 int get id; ScheduleSession get session; DateTime get arrivalTime; int get icarId; int get icarStopId; Icar? get icar; IcarStop? get icarStop; int? get ticketCount;
/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleCopyWith<Schedule> get copyWith => _$ScheduleCopyWithImpl<Schedule>(this as Schedule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Schedule&&(identical(other.id, id) || other.id == id)&&(identical(other.session, session) || other.session == session)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.icar, icar) || other.icar == icar)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop)&&(identical(other.ticketCount, ticketCount) || other.ticketCount == ticketCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,session,arrivalTime,icarId,icarStopId,icar,icarStop,ticketCount);

@override
String toString() {
  return 'Schedule(id: $id, session: $session, arrivalTime: $arrivalTime, icarId: $icarId, icarStopId: $icarStopId, icar: $icar, icarStop: $icarStop, ticketCount: $ticketCount)';
}


}

/// @nodoc
abstract mixin class $ScheduleCopyWith<$Res>  {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) _then) = _$ScheduleCopyWithImpl;
@useResult
$Res call({
 int id, ScheduleSession session, DateTime arrivalTime, int icarId, int icarStopId, Icar? icar, IcarStop? icarStop, int? ticketCount
});


$IcarCopyWith<$Res>? get icar;$IcarStopCopyWith<$Res>? get icarStop;

}
/// @nodoc
class _$ScheduleCopyWithImpl<$Res>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._self, this._then);

  final Schedule _self;
  final $Res Function(Schedule) _then;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? session = null,Object? arrivalTime = null,Object? icarId = null,Object? icarStopId = null,Object? icar = freezed,Object? icarStop = freezed,Object? ticketCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as ScheduleSession,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime,icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,icar: freezed == icar ? _self.icar : icar // ignore: cast_nullable_to_non_nullable
as Icar?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStop?,ticketCount: freezed == ticketCount ? _self.ticketCount : ticketCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarCopyWith<$Res>? get icar {
    if (_self.icar == null) {
    return null;
  }

  return $IcarCopyWith<$Res>(_self.icar!, (value) {
    return _then(_self.copyWith(icar: value));
  });
}/// Create a copy of Schedule
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


class _Schedule extends Schedule {
  const _Schedule({required this.id, required this.session, required this.arrivalTime, required this.icarId, required this.icarStopId, this.icar, this.icarStop, this.ticketCount}): super._();
  

@override final  int id;
@override final  ScheduleSession session;
@override final  DateTime arrivalTime;
@override final  int icarId;
@override final  int icarStopId;
@override final  Icar? icar;
@override final  IcarStop? icarStop;
@override final  int? ticketCount;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleCopyWith<_Schedule> get copyWith => __$ScheduleCopyWithImpl<_Schedule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Schedule&&(identical(other.id, id) || other.id == id)&&(identical(other.session, session) || other.session == session)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.icarStopId, icarStopId) || other.icarStopId == icarStopId)&&(identical(other.icar, icar) || other.icar == icar)&&(identical(other.icarStop, icarStop) || other.icarStop == icarStop)&&(identical(other.ticketCount, ticketCount) || other.ticketCount == ticketCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,session,arrivalTime,icarId,icarStopId,icar,icarStop,ticketCount);

@override
String toString() {
  return 'Schedule(id: $id, session: $session, arrivalTime: $arrivalTime, icarId: $icarId, icarStopId: $icarStopId, icar: $icar, icarStop: $icarStop, ticketCount: $ticketCount)';
}


}

/// @nodoc
abstract mixin class _$ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$ScheduleCopyWith(_Schedule value, $Res Function(_Schedule) _then) = __$ScheduleCopyWithImpl;
@override @useResult
$Res call({
 int id, ScheduleSession session, DateTime arrivalTime, int icarId, int icarStopId, Icar? icar, IcarStop? icarStop, int? ticketCount
});


@override $IcarCopyWith<$Res>? get icar;@override $IcarStopCopyWith<$Res>? get icarStop;

}
/// @nodoc
class __$ScheduleCopyWithImpl<$Res>
    implements _$ScheduleCopyWith<$Res> {
  __$ScheduleCopyWithImpl(this._self, this._then);

  final _Schedule _self;
  final $Res Function(_Schedule) _then;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? session = null,Object? arrivalTime = null,Object? icarId = null,Object? icarStopId = null,Object? icar = freezed,Object? icarStop = freezed,Object? ticketCount = freezed,}) {
  return _then(_Schedule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as ScheduleSession,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime,icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,icarStopId: null == icarStopId ? _self.icarStopId : icarStopId // ignore: cast_nullable_to_non_nullable
as int,icar: freezed == icar ? _self.icar : icar // ignore: cast_nullable_to_non_nullable
as Icar?,icarStop: freezed == icarStop ? _self.icarStop : icarStop // ignore: cast_nullable_to_non_nullable
as IcarStop?,ticketCount: freezed == ticketCount ? _self.ticketCount : ticketCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarCopyWith<$Res>? get icar {
    if (_self.icar == null) {
    return null;
  }

  return $IcarCopyWith<$Res>(_self.icar!, (value) {
    return _then(_self.copyWith(icar: value));
  });
}/// Create a copy of Schedule
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
