import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/user/user.dart';

part 'auth_success_response.g.dart';
part 'auth_success_response.freezed.dart';

@freezed
abstract class AuthSuccessResponse with _$AuthSuccessResponse {
  const factory AuthSuccessResponse({
    required User user,
    required String token,
  }) = _AuthSuccessResponse;

  factory AuthSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthSuccessResponseFromJson(json);
}
