import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'icar_route.freezed.dart';
part 'icar_route.g.dart';

@freezed
abstract class IcarRoute with _$IcarRoute {
  const factory IcarRoute({
    required int id,
    required String name,
    @JsonKey(name: "hexColor", fromJson: _colorFromJson, toJson: _colorToJson)
    required Color color,
    List<LatLng>? polylinePoints,
  }) = _IcarRoute;

  factory IcarRoute.fromJson(Map<String, Object?> json) =>
      _$IcarRouteFromJson(json);
}

Color _colorFromJson(String colorString) => Color(int.parse(colorString));
String _colorToJson(Color color) => color.toString();
