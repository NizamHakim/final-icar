// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_websocket_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
IcarWebsocketResponseModel _$IcarWebsocketResponseModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'position':
          return IcarPositionWebsocketResponse.fromJson(
            json
          );
                case 'disconnect':
          return IcarDisconnectedWebsocketResponse.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'IcarWebsocketResponseModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$IcarWebsocketResponseModel {

 String get type; IcarPositionModel get icarPosition;
/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarWebsocketResponseModelCopyWith<IcarWebsocketResponseModel> get copyWith => _$IcarWebsocketResponseModelCopyWithImpl<IcarWebsocketResponseModel>(this as IcarWebsocketResponseModel, _$identity);

  /// Serializes this IcarWebsocketResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarWebsocketResponseModel&&(identical(other.type, type) || other.type == type)&&(identical(other.icarPosition, icarPosition) || other.icarPosition == icarPosition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,icarPosition);

@override
String toString() {
  return 'IcarWebsocketResponseModel(type: $type, icarPosition: $icarPosition)';
}


}

/// @nodoc
abstract mixin class $IcarWebsocketResponseModelCopyWith<$Res>  {
  factory $IcarWebsocketResponseModelCopyWith(IcarWebsocketResponseModel value, $Res Function(IcarWebsocketResponseModel) _then) = _$IcarWebsocketResponseModelCopyWithImpl;
@useResult
$Res call({
 String type, IcarPositionModel icarPosition
});


$IcarPositionModelCopyWith<$Res> get icarPosition;

}
/// @nodoc
class _$IcarWebsocketResponseModelCopyWithImpl<$Res>
    implements $IcarWebsocketResponseModelCopyWith<$Res> {
  _$IcarWebsocketResponseModelCopyWithImpl(this._self, this._then);

  final IcarWebsocketResponseModel _self;
  final $Res Function(IcarWebsocketResponseModel) _then;

/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? icarPosition = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,icarPosition: null == icarPosition ? _self.icarPosition : icarPosition // ignore: cast_nullable_to_non_nullable
as IcarPositionModel,
  ));
}
/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarPositionModelCopyWith<$Res> get icarPosition {
  
  return $IcarPositionModelCopyWith<$Res>(_self.icarPosition, (value) {
    return _then(_self.copyWith(icarPosition: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class IcarPositionWebsocketResponse implements IcarWebsocketResponseModel {
  const IcarPositionWebsocketResponse({required this.type, required this.icarPosition, required final  List<TicketProximityModel> ticketsProximity}): _ticketsProximity = ticketsProximity;
  factory IcarPositionWebsocketResponse.fromJson(Map<String, dynamic> json) => _$IcarPositionWebsocketResponseFromJson(json);

@override final  String type;
@override final  IcarPositionModel icarPosition;
 final  List<TicketProximityModel> _ticketsProximity;
 List<TicketProximityModel> get ticketsProximity {
  if (_ticketsProximity is EqualUnmodifiableListView) return _ticketsProximity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ticketsProximity);
}


/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarPositionWebsocketResponseCopyWith<IcarPositionWebsocketResponse> get copyWith => _$IcarPositionWebsocketResponseCopyWithImpl<IcarPositionWebsocketResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarPositionWebsocketResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarPositionWebsocketResponse&&(identical(other.type, type) || other.type == type)&&(identical(other.icarPosition, icarPosition) || other.icarPosition == icarPosition)&&const DeepCollectionEquality().equals(other._ticketsProximity, _ticketsProximity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,icarPosition,const DeepCollectionEquality().hash(_ticketsProximity));

@override
String toString() {
  return 'IcarWebsocketResponseModel.position(type: $type, icarPosition: $icarPosition, ticketsProximity: $ticketsProximity)';
}


}

/// @nodoc
abstract mixin class $IcarPositionWebsocketResponseCopyWith<$Res> implements $IcarWebsocketResponseModelCopyWith<$Res> {
  factory $IcarPositionWebsocketResponseCopyWith(IcarPositionWebsocketResponse value, $Res Function(IcarPositionWebsocketResponse) _then) = _$IcarPositionWebsocketResponseCopyWithImpl;
@override @useResult
$Res call({
 String type, IcarPositionModel icarPosition, List<TicketProximityModel> ticketsProximity
});


@override $IcarPositionModelCopyWith<$Res> get icarPosition;

}
/// @nodoc
class _$IcarPositionWebsocketResponseCopyWithImpl<$Res>
    implements $IcarPositionWebsocketResponseCopyWith<$Res> {
  _$IcarPositionWebsocketResponseCopyWithImpl(this._self, this._then);

  final IcarPositionWebsocketResponse _self;
  final $Res Function(IcarPositionWebsocketResponse) _then;

/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? icarPosition = null,Object? ticketsProximity = null,}) {
  return _then(IcarPositionWebsocketResponse(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,icarPosition: null == icarPosition ? _self.icarPosition : icarPosition // ignore: cast_nullable_to_non_nullable
as IcarPositionModel,ticketsProximity: null == ticketsProximity ? _self._ticketsProximity : ticketsProximity // ignore: cast_nullable_to_non_nullable
as List<TicketProximityModel>,
  ));
}

/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarPositionModelCopyWith<$Res> get icarPosition {
  
  return $IcarPositionModelCopyWith<$Res>(_self.icarPosition, (value) {
    return _then(_self.copyWith(icarPosition: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class IcarDisconnectedWebsocketResponse implements IcarWebsocketResponseModel {
  const IcarDisconnectedWebsocketResponse({required this.type, required this.icarPosition, required this.canceledTickets});
  factory IcarDisconnectedWebsocketResponse.fromJson(Map<String, dynamic> json) => _$IcarDisconnectedWebsocketResponseFromJson(json);

@override final  String type;
@override final  IcarPositionModel icarPosition;
 final  int canceledTickets;

/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarDisconnectedWebsocketResponseCopyWith<IcarDisconnectedWebsocketResponse> get copyWith => _$IcarDisconnectedWebsocketResponseCopyWithImpl<IcarDisconnectedWebsocketResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarDisconnectedWebsocketResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarDisconnectedWebsocketResponse&&(identical(other.type, type) || other.type == type)&&(identical(other.icarPosition, icarPosition) || other.icarPosition == icarPosition)&&(identical(other.canceledTickets, canceledTickets) || other.canceledTickets == canceledTickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,icarPosition,canceledTickets);

@override
String toString() {
  return 'IcarWebsocketResponseModel.disconnect(type: $type, icarPosition: $icarPosition, canceledTickets: $canceledTickets)';
}


}

/// @nodoc
abstract mixin class $IcarDisconnectedWebsocketResponseCopyWith<$Res> implements $IcarWebsocketResponseModelCopyWith<$Res> {
  factory $IcarDisconnectedWebsocketResponseCopyWith(IcarDisconnectedWebsocketResponse value, $Res Function(IcarDisconnectedWebsocketResponse) _then) = _$IcarDisconnectedWebsocketResponseCopyWithImpl;
@override @useResult
$Res call({
 String type, IcarPositionModel icarPosition, int canceledTickets
});


@override $IcarPositionModelCopyWith<$Res> get icarPosition;

}
/// @nodoc
class _$IcarDisconnectedWebsocketResponseCopyWithImpl<$Res>
    implements $IcarDisconnectedWebsocketResponseCopyWith<$Res> {
  _$IcarDisconnectedWebsocketResponseCopyWithImpl(this._self, this._then);

  final IcarDisconnectedWebsocketResponse _self;
  final $Res Function(IcarDisconnectedWebsocketResponse) _then;

/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? icarPosition = null,Object? canceledTickets = null,}) {
  return _then(IcarDisconnectedWebsocketResponse(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,icarPosition: null == icarPosition ? _self.icarPosition : icarPosition // ignore: cast_nullable_to_non_nullable
as IcarPositionModel,canceledTickets: null == canceledTickets ? _self.canceledTickets : canceledTickets // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of IcarWebsocketResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IcarPositionModelCopyWith<$Res> get icarPosition {
  
  return $IcarPositionModelCopyWith<$Res>(_self.icarPosition, (value) {
    return _then(_self.copyWith(icarPosition: value));
  });
}
}

// dart format on
