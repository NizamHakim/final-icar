import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_history_viewmodel.dart';
import 'package:icar/ui/ticket/widgets/history_review/review/review.dart';
import 'package:icar/ui/ticket/widgets/history_review/suggestion/suggestion.dart';
import 'package:icar/util/show_snackbar.dart';

class ReviewAndSuggestion extends ConsumerWidget {
  const ReviewAndSuggestion({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(updateReviewProvider).isLoading;

    ref.listen(updateReviewProvider, (_, next) {
      next.when(
        data: (ticket) {
          if (ticket != null) {
            ref.invalidate(ticketHistoryProvider(ticket: ticket));
          }
        },
        loading: () {},
        error: (error, _) {
          showSnackBar(
            context,
            SnackBar(
              content: Text(
                CoreLocalizations.of(context)!.internalServerError,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.error500,
            ),
          );
        },
      );
    });

    return Column(
      children: [
        const Review(),
        const Divider(color: AppColors.gray50, thickness: 1, height: 40),
        const Suggestion(),
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
                CoreLocalizations.of(context)!.submit,
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
          CoreLocalizations.of(context)!.submit,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
