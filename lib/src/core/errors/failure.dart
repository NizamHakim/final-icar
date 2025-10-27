import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/core/errors/exception.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.authFailure({required String message}) = AuthFailure;
  const factory Failure.serverFailure({required String message}) =
      ServerFailure;
  const factory Failure.validationFailure({
    required String message,
    required Map<String, String> errors,
  }) = ValidationFailure;
  const factory Failure.networkFailure({
    @Default("network.error") String message,
  }) = NetworkFailure;
  const factory Failure.unexpectedFailure({required String message}) =
      UnexpectedFailure;

  factory Failure.fromException(Object exception) {
    switch (exception) {
      case SocketException():
        return const NetworkFailure();
      case UnauthorizedException():
        return AuthFailure(message: exception.message);
      case NotFoundException():
        return ServerFailure(message: exception.message);
      case UnprocessableContentException():
        return ValidationFailure(
          message: exception.message,
          errors: exception.errors,
        );
      case InternalServerErrorException():
        return ServerFailure(message: exception.message);
      default:
        return UnexpectedFailure(message: exception.toString());
    }
  }
}
