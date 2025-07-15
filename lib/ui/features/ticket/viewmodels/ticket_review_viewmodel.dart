import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/review/review.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/review_repository/remote/review_repository.dart';
import 'package:icar/data/repositories/review_repository/responses/review_options_response.dart';
import 'package:icar/data/repositories/ticket_repository/remote/ticket_repository.dart';
import 'package:icar/util/refresh_tickets_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_review_viewmodel.g.dart';

@riverpod
class Rating extends _$Rating {
  @override
  int build() {
    return 0;
  }

  void setRating(int rating) {
    ref.read(isDoingReviewProvider.notifier).setState(true);
    state = rating;
  }
}

@riverpod
class IsDoingReview extends _$IsDoingReview {
  @override
  bool build() {
    return false;
  }

  void setState(bool isDoingReview) {
    state = isDoingReview;
  }
}

@riverpod
Future<Ticket> ticketHistory(Ref ref, int ticketId) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketEither = await ticketRepository.getTicketDetails(ticketId);

  return ticketEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (ticket) {
      return ticket;
    },
  );
}

@riverpod
Future<ReviewOptionsResponse> reviewSuggestionOptions(Ref ref) async {
  final reviewRepository = ref.watch(reviewRepositoryProvider);
  final reviewOptionsEither = await reviewRepository.getReviewOptions();

  return reviewOptionsEither.fold(
    (failure) {
      throw Exception(failure.error);
    },
    (reviewOptions) {
      return reviewOptions;
    },
  );
}

@riverpod
Future<List<String>> reviewOptions(Ref ref) async {
  final reviewSuggestionOptions = await ref.watch(
    reviewSuggestionOptionsProvider.future,
  );
  final rating = ref.watch(ratingProvider);

  return reviewSuggestionOptions.reviewOptions[rating]!;
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

@riverpod
class SuggestionInput extends _$SuggestionInput {
  @override
  String build() {
    return '';
  }

  void setSuggestion(String suggestion) {
    state = suggestion;
  }
}

@riverpod
class UpdateReview extends _$UpdateReview {
  @override
  FutureOr<Ticket?> build() {
    return null;
  }

  Future<void> updateReview(Ticket ticket) async {
    state = const AsyncValue.loading();

    final rating = ref.watch(ratingProvider);
    final review = ref.watch(selectedReviewProvider);
    final suggestion = ref.watch(suggestionInputProvider);
    final ticketRepository = ref.watch(ticketRepositoryProvider);

    final newReview = Review(
      rating: rating,
      review: review,
      suggestion: suggestion,
    );

    final updateReviewEither = await ticketRepository.updateReview(
      ticket.id,
      newReview,
    );

    updateReviewEither.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
      (ticket) {
        state = AsyncValue.data(ticket);
        refreshTicketById(ref, ticket.id);
        ref.read(isDoingReviewProvider.notifier).setState(false);
      },
    );
  }
}
