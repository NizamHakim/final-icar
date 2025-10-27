// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icar_position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IcarPositionModel {

 int get id; String? get name;@JsonKey(fromJson: positionFromJson, toJson: positionToJson) Position? get position;
/// Create a copy of IcarPositionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcarPositionModelCopyWith<IcarPositionModel> get copyWith => _$IcarPositionModelCopyWithImpl<IcarPositionModel>(this as IcarPositionModel, _$identity);

  /// Serializes this IcarPositionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcarPositionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,position);

@override
String toString() {
  return 'IcarPositionModel(id: $id, name: $name, position: $position)';
}


}

/// @nodoc
abstract mixin class $IcarPositionModelCopyWith<$Res>  {
  factory $IcarPositionModelCopyWith(IcarPositionModel value, $Res Function(IcarPositionModel) _then) = _$IcarPositionModelCopyWithImpl;
@useResult
$Res call({
 int id, String? name,@JsonKey(fromJson: positionFromJson, toJson: positionToJson) Position? position
});




}
/// @nodoc
class _$IcarPositionModelCopyWithImpl<$Res>
    implements $IcarPositionModelCopyWith<$Res> {
  _$IcarPositionModelCopyWithImpl(this._self, this._then);

  final IcarPositionModel _self;
  final $Res Function(IcarPositionModel) _then;

/// Create a copy of IcarPositionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? position = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IcarPositionModel extends IcarPositionModel {
  const _IcarPositionModel({required this.id, this.name, @JsonKey(fromJson: positionFromJson, toJson: positionToJson) this.position}): super._();
  factory _IcarPositionModel.fromJson(Map<String, dynamic> json) => _$IcarPositionModelFromJson(json);

@override final  int id;
@override final  String? name;
@override@JsonKey(fromJson: positionFromJson, toJson: positionToJson) final  Position? position;

/// Create a copy of IcarPositionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcarPositionModelCopyWith<_IcarPositionModel> get copyWith => __$IcarPositionModelCopyWithImpl<_IcarPositionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcarPositionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcarPositionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,position);

@override
String toString() {
  return 'IcarPositionModel(id: $id, name: $name, position: $position)';
}


}

/// @nodoc
abstract mixin class _$IcarPositionModelCopyWith<$Res> implements $IcarPositionModelCopyWith<$Res> {
  factory _$IcarPositionModelCopyWith(_IcarPositionModel value, $Res Function(_IcarPositionModel) _then) = __$IcarPositionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name,@JsonKey(fromJson: positionFromJson, toJson: positionToJson) Position? position
});




}
/// @nodoc
class __$IcarPositionModelCopyWithImpl<$Res>
    implements _$IcarPositionModelCopyWith<$Res> {
  __$IcarPositionModelCopyWithImpl(this._self, this._then);

  final _IcarPositionModel _self;
  final $Res Function(_IcarPositionModel) _then;

/// Create a copy of IcarPositionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? position = freezed,}) {
  return _then(_IcarPositionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position?,
  ));
}


}

// dart format on
