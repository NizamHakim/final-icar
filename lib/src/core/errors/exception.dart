import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/utils/json_converter/status_code_converter.dart';

part 'exception.freezed.dart';
part 'exception.g.dart';

@Freezed(unionKey: 'statusCode')
sealed class ServerException with _$ServerException implements Exception {
  @FreezedUnionValue('401')
  const factory ServerException.unauthorized({
    @JsonKey(fromJson: statusCodeConverter) required int statusCode,
    required String message,
  }) = UnauthorizedException;
  @FreezedUnionValue('404')
  const factory ServerException.notFound({
    @JsonKey(fromJson: statusCodeConverter) required int statusCode,
    required String message,
  }) = NotFoundException;
  @FreezedUnionValue('422')
  const factory ServerException.unprocessableContent({
    @JsonKey(fromJson: statusCodeConverter) required int statusCode,
    required String message,
    required Map<String, String> errors,
  }) = UnprocessableContentException;
  @FreezedUnionValue('500')
  const factory ServerException.internalServerError({
    @JsonKey(fromJson: statusCodeConverter) required int statusCode,
    required String message,
  }) = InternalServerErrorException;

  factory ServerException.fromJson(Map<String, dynamic> json) =>
      _$ServerExceptionFromJson(json);
}
