// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_proximity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketProximity {

 int get ticketId; int get distance;
/// Create a copy of TicketProximity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketProximityCopyWith<TicketProximity> get copyWith => _$TicketProximityCopyWithImpl<TicketProximity>(this as TicketProximity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketProximity&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId,distance);

@override
String toString() {
  return 'TicketProximity(ticketId: $ticketId, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $TicketProximityCopyWith<$Res>  {
  factory $TicketProximityCopyWith(TicketProximity value, $Res Function(TicketProximity) _then) = _$TicketProximityCopyWithImpl;
@useResult
$Res call({
 int ticketId, int distance
});




}
/// @nodoc
class _$TicketProximityCopyWithImpl<$Res>
    implements $TicketProximityCopyWith<$Res> {
  _$TicketProximityCopyWithImpl(this._self, this._then);

  final TicketProximity _self;
  final $Res Function(TicketProximity) _then;

/// Create a copy of TicketProximity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketId = null,Object? distance = null,}) {
  return _then(_self.copyWith(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _TicketProximity extends TicketProximity {
  const _TicketProximity({required this.ticketId, required this.distance}): super._();
  

@override final  int ticketId;
@override final  int distance;

/// Create a copy of TicketProximity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketProximityCopyWith<_TicketProximity> get copyWith => __$TicketProximityCopyWithImpl<_TicketProximity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketProximity&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId,distance);

@override
String toString() {
  return 'TicketProximity(ticketId: $ticketId, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$TicketProximityCopyWith<$Res> implements $TicketProximityCopyWith<$Res> {
  factory _$TicketProximityCopyWith(_TicketProximity value, $Res Function(_TicketProximity) _then) = __$TicketProximityCopyWithImpl;
@override @useResult
$Res call({
 int ticketId, int distance
});




}
/// @nodoc
class __$TicketProximityCopyWithImpl<$Res>
    implements _$TicketProximityCopyWith<$Res> {
  __$TicketProximityCopyWithImpl(this._self, this._then);

  final _TicketProximity _self;
  final $Res Function(_TicketProximity) _then;

/// Create a copy of TicketProximity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketId = null,Object? distance = null,}) {
  return _then(_TicketProximity(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
