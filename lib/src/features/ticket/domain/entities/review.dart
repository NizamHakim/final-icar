import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required int rating,
    required List<String> review,
    required String suggestion,
  }) = _Review;
}
