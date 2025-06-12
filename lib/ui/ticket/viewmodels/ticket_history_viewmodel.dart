import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/review.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/data/repositories/ticket_repository/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_history_viewmodel.g.dart';

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
Future<Ticket> ticketHistory(Ref ref, {required Ticket ticket}) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final ticketEither = await ticketRepository.getTicketDetails(ticket);

  return ticketEither.fold(
    (error) {
      throw Exception(error.message);
    },
    (ticket) {
      return ticket;
    },
  );
}

@riverpod
Future<ReviewOptionsResponse> reviewSuggestionOptions(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final reviewOptionsEither = await ticketRepository.getReviewOptions();

  return reviewOptionsEither.fold(
    (error) {
      throw Exception(error.message);
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
    print(newReview);

    final updateReviewEither = await ticketRepository.updateReview(
      ticket,
      newReview,
    );

    state = updateReviewEither.fold(
      (error) {
        return AsyncValue.error(error, StackTrace.current);
      },
      (updatedTicket) {
        return AsyncValue.data(updatedTicket);
      },
    );
  }
}
