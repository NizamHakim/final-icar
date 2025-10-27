// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_proximity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketProximityModel {

 int get ticketId; int get distance;
/// Create a copy of TicketProximityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketProximityModelCopyWith<TicketProximityModel> get copyWith => _$TicketProximityModelCopyWithImpl<TicketProximityModel>(this as TicketProximityModel, _$identity);

  /// Serializes this TicketProximityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketProximityModel&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketId,distance);

@override
String toString() {
  return 'TicketProximityModel(ticketId: $ticketId, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $TicketProximityModelCopyWith<$Res>  {
  factory $TicketProximityModelCopyWith(TicketProximityModel value, $Res Function(TicketProximityModel) _then) = _$TicketProximityModelCopyWithImpl;
@useResult
$Res call({
 int ticketId, int distance
});




}
/// @nodoc
class _$TicketProximityModelCopyWithImpl<$Res>
    implements $TicketProximityModelCopyWith<$Res> {
  _$TicketProximityModelCopyWithImpl(this._self, this._then);

  final TicketProximityModel _self;
  final $Res Function(TicketProximityModel) _then;

/// Create a copy of TicketProximityModel
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
@JsonSerializable()

class _TicketProximityModel extends TicketProximityModel {
  const _TicketProximityModel({required this.ticketId, required this.distance}): super._();
  factory _TicketProximityModel.fromJson(Map<String, dynamic> json) => _$TicketProximityModelFromJson(json);

@override final  int ticketId;
@override final  int distance;

/// Create a copy of TicketProximityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketProximityModelCopyWith<_TicketProximityModel> get copyWith => __$TicketProximityModelCopyWithImpl<_TicketProximityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketProximityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketProximityModel&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketId,distance);

@override
String toString() {
  return 'TicketProximityModel(ticketId: $ticketId, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$TicketProximityModelCopyWith<$Res> implements $TicketProximityModelCopyWith<$Res> {
  factory _$TicketProximityModelCopyWith(_TicketProximityModel value, $Res Function(_TicketProximityModel) _then) = __$TicketProximityModelCopyWithImpl;
@override @useResult
$Res call({
 int ticketId, int distance
});




}
/// @nodoc
class __$TicketProximityModelCopyWithImpl<$Res>
    implements _$TicketProximityModelCopyWith<$Res> {
  __$TicketProximityModelCopyWithImpl(this._self, this._then);

  final _TicketProximityModel _self;
  final $Res Function(_TicketProximityModel) _then;

/// Create a copy of TicketProximityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketId = null,Object? distance = null,}) {
  return _then(_TicketProximityModel(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
