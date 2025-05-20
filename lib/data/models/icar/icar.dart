// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';

part 'icar.freezed.dart';
part 'icar.g.dart';

enum IcarStatus { ACTIVE, INACTIVE }

@freezed
abstract class Icar with _$Icar {
  const factory Icar({
    required int id,
    required String name,
    required int capacity,
    required IcarStatus status,
    IcarRoute? route,
  }) = _Icar;

  factory Icar.fromJson(Map<String, Object?> json) => _$IcarFromJson(json);
}
