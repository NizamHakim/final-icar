// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_position_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
IcarWebSocketResponse _$IcarWebSocketResponseFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'position':
          return PositionResponse.fromJson(
            json
          );
                case 'disconnected':
          return DisconnectedResponse.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'IcarWebSocketResponse',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$IcarWebSocketResponse {

 IcarWebSocketResponseType get type;
/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarWebSocketResponseCopyWith<IcarWebSocketResponse> get copyWith => _$IcarWebSocketResponseCopyWithImpl<IcarWebSocketResponse>(this as IcarWebSocketResponse, _$identity);

  /// Serializes this IcarWebSocketResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarWebSocketResponse&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'IcarWebSocketResponse(type: $type)';
}


}

/// @nodoc
abstract mixin class $IcarWebSocketResponseCopyWith<$Res>  {
  factory $IcarWebSocketResponseCopyWith(IcarWebSocketResponse value, $Res Function(IcarWebSocketResponse) _then) = _$IcarWebSocketResponseCopyWithImpl;
@useResult
$Res call({
 IcarWebSocketResponseType type
});




}
/// @nodoc
class _$IcarWebSocketResponseCopyWithImpl<$Res>
    implements $IcarWebSocketResponseCopyWith<$Res> {
  _$IcarWebSocketResponseCopyWithImpl(this._self, this._then);

  final IcarWebSocketResponse _self;
  final $Res Function(IcarWebSocketResponse) _then;

/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IcarWebSocketResponseType,
  ));
}

}


/// @nodoc
@JsonSerializable()

class PositionResponse implements IcarWebSocketResponse {
  const PositionResponse({required this.type, required this.icarId, @JsonKey(fromJson: positionFromJson, toJson: positionToJson) required this.position});
  factory PositionResponse.fromJson(Map<String, dynamic> json) => _$PositionResponseFromJson(json);

@override final  IcarWebSocketResponseType type;
 final  int icarId;
@JsonKey(fromJson: positionFromJson, toJson: positionToJson) final  Position position;

/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PositionResponseCopyWith<PositionResponse> get copyWith => _$PositionResponseCopyWithImpl<PositionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PositionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PositionResponse&&(identical(other.type, type) || other.type == type)&&(identical(other.icarId, icarId) || other.icarId == icarId)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,icarId,position);

@override
String toString() {
  return 'IcarWebSocketResponse.position(type: $type, icarId: $icarId, position: $position)';
}


}

/// @nodoc
abstract mixin class $PositionResponseCopyWith<$Res> implements $IcarWebSocketResponseCopyWith<$Res> {
  factory $PositionResponseCopyWith(PositionResponse value, $Res Function(PositionResponse) _then) = _$PositionResponseCopyWithImpl;
@override @useResult
$Res call({
 IcarWebSocketResponseType type, int icarId,@JsonKey(fromJson: positionFromJson, toJson: positionToJson) Position position
});




}
/// @nodoc
class _$PositionResponseCopyWithImpl<$Res>
    implements $PositionResponseCopyWith<$Res> {
  _$PositionResponseCopyWithImpl(this._self, this._then);

  final PositionResponse _self;
  final $Res Function(PositionResponse) _then;

/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? icarId = null,Object? position = null,}) {
  return _then(PositionResponse(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IcarWebSocketResponseType,icarId: null == icarId ? _self.icarId : icarId // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DisconnectedResponse implements IcarWebSocketResponse {
  const DisconnectedResponse({required this.type, required this.icar});
  factory DisconnectedResponse.fromJson(Map<String, dynamic> json) => _$DisconnectedResponseFromJson(json);

@override final  IcarWebSocketResponseType type;
 final  Icar icar;

/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisconnectedResponseCopyWith<DisconnectedResponse> get copyWith => _$DisconnectedResponseCopyWithImpl<DisconnectedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DisconnectedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisconnectedResponse&&(identical(other.type, type) || other.type == type)&&(identical(other.icar, icar) || other.icar == icar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,icar);

@override
String toString() {
  return 'IcarWebSocketResponse.disconnected(type: $type, icar: $icar)';
}


}

/// @nodoc
abstract mixin class $DisconnectedResponseCopyWith<$Res> implements $IcarWebSocketResponseCopyWith<$Res> {
  factory $DisconnectedResponseCopyWith(DisconnectedResponse value, $Res Function(DisconnectedResponse) _then) = _$DisconnectedResponseCopyWithImpl;
@override @useResult
$Res call({
 IcarWebSocketResponseType type, Icar icar
});


$IcarCopyWith<$Res> get icar;

}
/// @nodoc
class _$DisconnectedResponseCopyWithImpl<$Res>
    implements $DisconnectedResponseCopyWith<$Res> {
  _$DisconnectedResponseCopyWithImpl(this._self, this._then);

  final DisconnectedResponse _self;
  final $Res Function(DisconnectedResponse) _then;

/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? icar = null,}) {
  return _then(DisconnectedResponse(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IcarWebSocketResponseType,icar: null == icar ? _self.icar : icar // ignore: cast_nullable_to_non_nullable
as Icar,
  ));
}

/// Create a copy of IcarWebSocketResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarCopyWith<$Res> get icar {
  
  return $IcarCopyWith<$Res>(_self.icar, (value) {
    return _then(_self.copyWith(icar: value));
  });
}
}

// dart format on
