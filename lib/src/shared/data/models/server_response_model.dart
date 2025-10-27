import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/data/models/pagination_model.dart';
import 'package:icar/src/utils/json_converter/status_code_converter.dart';

part 'server_response_model.freezed.dart';
part 'server_response_model.g.dart';

@freezed
abstract class ServerResponseModel with _$ServerResponseModel {
  const ServerResponseModel._();

  const factory ServerResponseModel({
    @JsonKey(fromJson: statusCodeConverter) required int statusCode,
    required dynamic data,
    String? message,
    PaginationModel? pagination,
  }) = _ServerResponseModel;

  factory ServerResponseModel.fromJson(Map<String, Object?> json) =>
      _$ServerResponseModelFromJson(json);
}
