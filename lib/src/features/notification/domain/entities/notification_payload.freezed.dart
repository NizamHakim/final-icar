// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
NotificationPayload _$NotificationPayloadFromJson(
  Map<String, dynamic> json
) {
        switch (json['notificationType']) {
                  case 'ticketDetails':
          return TicketDetailsNotification.fromJson(
            json
          );
                case 'ticketReview':
          return TicketReviewNotification.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'notificationType',
  'NotificationPayload',
  'Invalid union type "${json['notificationType']}"!'
);
        }
      
}

/// @nodoc
mixin _$NotificationPayload {

 String get notificationType; int get ticketId;
/// Create a copy of NotificationPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPayloadCopyWith<NotificationPayload> get copyWith => _$NotificationPayloadCopyWithImpl<NotificationPayload>(this as NotificationPayload, _$identity);

  /// Serializes this NotificationPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPayload&&(identical(other.notificationType, notificationType) || other.notificationType == notificationType)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationType,ticketId);

@override
String toString() {
  return 'NotificationPayload(notificationType: $notificationType, ticketId: $ticketId)';
}


}

/// @nodoc
abstract mixin class $NotificationPayloadCopyWith<$Res>  {
  factory $NotificationPayloadCopyWith(NotificationPayload value, $Res Function(NotificationPayload) _then) = _$NotificationPayloadCopyWithImpl;
@useResult
$Res call({
 String notificationType, int ticketId
});




}
/// @nodoc
class _$NotificationPayloadCopyWithImpl<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  _$NotificationPayloadCopyWithImpl(this._self, this._then);

  final NotificationPayload _self;
  final $Res Function(NotificationPayload) _then;

/// Create a copy of NotificationPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationType = null,Object? ticketId = null,}) {
  return _then(_self.copyWith(
notificationType: null == notificationType ? _self.notificationType : notificationType // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class TicketDetailsNotification implements NotificationPayload {
  const TicketDetailsNotification({required this.notificationType, required this.ticketId});
  factory TicketDetailsNotification.fromJson(Map<String, dynamic> json) => _$TicketDetailsNotificationFromJson(json);

@override final  String notificationType;
@override final  int ticketId;

/// Create a copy of NotificationPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketDetailsNotificationCopyWith<TicketDetailsNotification> get copyWith => _$TicketDetailsNotificationCopyWithImpl<TicketDetailsNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketDetailsNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDetailsNotification&&(identical(other.notificationType, notificationType) || other.notificationType == notificationType)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationType,ticketId);

@override
String toString() {
  return 'NotificationPayload.ticketDetails(notificationType: $notificationType, ticketId: $ticketId)';
}


}

/// @nodoc
abstract mixin class $TicketDetailsNotificationCopyWith<$Res> implements $NotificationPayloadCopyWith<$Res> {
  factory $TicketDetailsNotificationCopyWith(TicketDetailsNotification value, $Res Function(TicketDetailsNotification) _then) = _$TicketDetailsNotificationCopyWithImpl;
@override @useResult
$Res call({
 String notificationType, int ticketId
});




}
/// @nodoc
class _$TicketDetailsNotificationCopyWithImpl<$Res>
    implements $TicketDetailsNotificationCopyWith<$Res> {
  _$TicketDetailsNotificationCopyWithImpl(this._self, this._then);

  final TicketDetailsNotification _self;
  final $Res Function(TicketDetailsNotification) _then;

/// Create a copy of NotificationPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationType = null,Object? ticketId = null,}) {
  return _then(TicketDetailsNotification(
notificationType: null == notificationType ? _self.notificationType : notificationType // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TicketReviewNotification implements NotificationPayload {
  const TicketReviewNotification({required this.notificationType, required this.ticketId});
  factory TicketReviewNotification.fromJson(Map<String, dynamic> json) => _$TicketReviewNotificationFromJson(json);

@override final  String notificationType;
@override final  int ticketId;

/// Create a copy of NotificationPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketReviewNotificationCopyWith<TicketReviewNotification> get copyWith => _$TicketReviewNotificationCopyWithImpl<TicketReviewNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketReviewNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketReviewNotification&&(identical(other.notificationType, notificationType) || other.notificationType == notificationType)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationType,ticketId);

@override
String toString() {
  return 'NotificationPayload.ticketReview(notificationType: $notificationType, ticketId: $ticketId)';
}


}

/// @nodoc
abstract mixin class $TicketReviewNotificationCopyWith<$Res> implements $NotificationPayloadCopyWith<$Res> {
  factory $TicketReviewNotificationCopyWith(TicketReviewNotification value, $Res Function(TicketReviewNotification) _then) = _$TicketReviewNotificationCopyWithImpl;
@override @useResult
$Res call({
 String notificationType, int ticketId
});




}
/// @nodoc
class _$TicketReviewNotificationCopyWithImpl<$Res>
    implements $TicketReviewNotificationCopyWith<$Res> {
  _$TicketReviewNotificationCopyWithImpl(this._self, this._then);

  final TicketReviewNotification _self;
  final $Res Function(TicketReviewNotification) _then;

/// Create a copy of NotificationPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationType = null,Object? ticketId = null,}) {
  return _then(TicketReviewNotification(
notificationType: null == notificationType ? _self.notificationType : notificationType // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
