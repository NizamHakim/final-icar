import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/text_badge.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_review_viewmodel.dart';

class ReviewBadge extends ConsumerWidget {
  const ReviewBadge({
    super.key,
    required this.reviewText,
    required this.reviewValue,
  });

  final String reviewText;
  final String reviewValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReview = ref.watch(selectedReviewProvider);
    final isSelected = selectedReview.contains(reviewValue);

    return GestureDetector(
      onTap: () {
        ref.read(selectedReviewProvider.notifier).toggleReview(reviewValue);
      },
      child: TextBadge(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        text: Text(reviewText, style: Theme.of(context).textTheme.labelMedium),
        foregroundColor: isSelected ? AppColors.white : AppColors.gray500,
        backgroundColor: isSelected ? AppColors.primary500 : AppColors.gray50,
      ),
    );
  }
}
