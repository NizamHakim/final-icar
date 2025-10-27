import 'package:icar/src/core/key/navigator_key.dart';

import 'package:icar/src/features/auth/domain/entities/user.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/features/ticket/domain/entities/review.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/repositories/ticket_repository.dart';
import 'package:icar/src/features/ticket/presentation/providers/rating.dart';
import 'package:icar/src/features/ticket/presentation/providers/review_options.dart';
import 'package:icar/src/features/ticket/presentation/providers/suggestion.dart';
import 'package:icar/src/l10n/generated/failure_localizations.dart';
import 'package:icar/src/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_ticket.g.dart';

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
class UpdateReview extends _$UpdateReview {
  late TicketRepository ticketRepository;
  late User currentUser;

  @override
  FutureOr<Ticket?> build() {
    ticketRepository = ref.watch(ticketRepositoryProvider);
    currentUser = ref.watch(currentUserProvider).requireValue!;
    return null;
  }

  Future<void> updateReview(Ticket ticket) async {
    state = const AsyncValue.loading();

    final rating = ref.read(ratingProvider);
    final selectedReview = ref.read(selectedReviewProvider);
    final suggestion = ref.read(suggestionProvider);

    final newReview = Review(
      rating: rating,
      review: selectedReview,
      suggestion: suggestion,
    );

    final updateReviewEither = await ticketRepository.updateReview(
      currentUser.token,
      ticket.id,
      newReview,
    );

    updateReviewEither.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        final (ticket, message) = data;
        state = AsyncValue.data(ticket);
        ref.read(isDoingReviewProvider.notifier).setState(false);
        showSnackBar(
          navigatorKey.currentContext!,
          FailureLocalizations.of(
            navigatorKey.currentContext!,
          )!.failure(message),
        );
      },
    );
  }
}
