import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/shared/domain/entities/pagination.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
abstract class PaginationModel with _$PaginationModel {
  const PaginationModel._();

  const factory PaginationModel({
    required bool hasNextCursor,
    int? nextCursor,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, Object?> json) =>
      _$PaginationModelFromJson(json);

  Pagination toEntity() {
    return Pagination(hasNextCursor: hasNextCursor, nextCursor: nextCursor);
  }
}
