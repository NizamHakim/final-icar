import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/src/features/ticket/domain/entities/review.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  const ReviewModel._();

  const factory ReviewModel({
    required int rating,
    required List<String> review,
    required String suggestion,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, Object?> json) =>
      _$ReviewModelFromJson(json);

  Review toEntity() {
    return Review(rating: rating, review: review, suggestion: suggestion);
  }

  factory ReviewModel.fromEntity(Review review) {
    return ReviewModel(
      rating: review.rating,
      review: review.review,
      suggestion: review.suggestion,
    );
  }
}
