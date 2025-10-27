import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/presentation/providers/review_ticket.dart';
import 'package:icar/src/features/ticket/presentation/widgets/review/review_badge_list.dart';
import 'package:icar/src/features/ticket/presentation/widgets/review/review_suggestion.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/circular_loader.dart';

class Review extends ConsumerWidget {
  const Review({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(updateReviewProvider).isLoading;

    return Column(
      children: [
        const ReviewBadgeList(),
        const Divider(color: AppColors.gray50, thickness: 1, height: 40),
        const ReviewSuggestion(),
        const Divider(color: AppColors.gray50, thickness: 1, height: 40),
        _submitButton(context, ref, isLoading),
      ],
    );
  }

  Widget _submitButton(BuildContext context, WidgetRef ref, bool isLoading) {
    if (isLoading) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.primary600,
            disabledBackgroundColor: AppColors.primary600.withValues(
              alpha: 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularLoader(size: 14, color: AppColors.white),
              const SizedBox(width: 8),
              Text(
                SharedLocalizations.of(context)!.submit,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await ref.read(updateReviewProvider.notifier).updateReview(ticket);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary600,
          disabledBackgroundColor: AppColors.primary600.withValues(alpha: 0.5),
        ),
        child: Text(
          SharedLocalizations.of(context)!.submit,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
