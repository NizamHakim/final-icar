// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'icar_stop.freezed.dart';
part 'icar_stop.g.dart';

@freezed
abstract class IcarStop with _$IcarStop {
  const factory IcarStop({
    required int id,
    required String name,
    required LatLng coordinate,
  }) = _IcarStop;

  factory IcarStop.fromJson(Map<String, Object?> json) =>
      _$IcarStopFromJson(json);
}
