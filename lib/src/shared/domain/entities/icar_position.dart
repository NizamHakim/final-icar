import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'icar_position.freezed.dart';

@freezed
abstract class IcarPosition with _$IcarPosition {
  const factory IcarPosition({
    required int id,
    String? name,
    Position? position,
  }) = _IcarPosition;
}
