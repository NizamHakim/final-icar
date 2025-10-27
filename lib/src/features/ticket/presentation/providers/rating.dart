import 'package:icar/src/features/ticket/presentation/providers/review_ticket.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.g.dart';

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
