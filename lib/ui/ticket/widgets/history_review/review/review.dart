import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_history_viewmodel.dart';
import 'package:icar/ui/ticket/widgets/history_review/review/review_badge.dart';
import 'package:icar/util/handle_error.dart';

class Review extends ConsumerWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(ratingProvider);
    final reviewOptions = ref.watch(reviewOptionsProvider);

    return reviewOptions.when(
      data: (options) {
        return Column(
          children: [
            Text(
              (rating == 5)
                  ? TicketLocalizations.of(context)!.whatsGood
                  : TicketLocalizations.of(context)!.whatShouldBeImproved,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.gray900,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: List.generate(
                options.length,
                (index) => ReviewBadge(
                  reviewText: TicketLocalizations.of(
                    context,
                  )!.reviewOptions(options[index]),
                  reviewValue: options[index],
                ),
              ),
            ),
          ],
        );
      },
      error: (error, _) {
        return handleError(context, error);
      },
      loading: () {
        return const CircularLoader();
      },
    );
  }
}
