import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/domain/repositories/review_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:icar/src/features/ticket/presentation/providers/rating.dart';

part 'review_options.g.dart';

@riverpod
Map<int, List<String>> reviewSuggestionOptions(Ref ref) {
  final reviewRepository = ref.watch(reviewRepositoryProvider);
  final reviewOptions = reviewRepository.getReviewOptions();

  return reviewOptions;
}

@riverpod
List<String> reviewOptions(Ref ref) {
  final reviewSuggestionOptions = ref.watch(reviewSuggestionOptionsProvider);
  final rating = ref.watch(ratingProvider);

  return reviewSuggestionOptions[rating]!;
}

@riverpod
class SelectedReview extends _$SelectedReview {
  @override
  List<String> build() {
    return [];
  }

  void toggleReview(String review) {
    final currentReviews = state.toList();
    if (currentReviews.contains(review)) {
      currentReviews.remove(review);
    } else {
      currentReviews.add(review);
    }
    state = currentReviews;
  }
}
