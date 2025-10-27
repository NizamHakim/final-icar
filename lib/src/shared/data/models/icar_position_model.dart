import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/shared/domain/entities/icar_position.dart';
import 'package:icar/src/utils/json_converter/position_json_converter.dart';

part 'icar_position_model.freezed.dart';
part 'icar_position_model.g.dart';

@freezed
abstract class IcarPositionModel with _$IcarPositionModel {
  const IcarPositionModel._();

  const factory IcarPositionModel({
    required int id,
    String? name,
    @JsonKey(fromJson: positionFromJson, toJson: positionToJson)
    Position? position,
  }) = _IcarPositionModel;

  factory IcarPositionModel.fromJson(Map<String, Object?> json) =>
      _$IcarPositionModelFromJson(json);

  IcarPosition toEntity() {
    return IcarPosition(id: id, name: name, position: position);
  }
}
