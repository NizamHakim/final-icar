import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/presentation/providers/rating.dart';
import 'package:icar/src/features/ticket/presentation/providers/review_options.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/features/ticket/presentation/widgets/review/review_badge.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class ReviewBadgeList extends ConsumerWidget {
  const ReviewBadgeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(ratingProvider);
    final reviewOptions = ref.watch(reviewOptionsProvider);

    return Column(
      children: [
        Text(
          (rating == 5)
              ? TicketLocalizations.of(context)!.whatIsGood
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
            reviewOptions.length,
            (index) => ReviewBadge(
              reviewText: TicketLocalizations.of(
                context,
              )!.reviewOptions(reviewOptions[index]),
              reviewValue: reviewOptions[index],
            ),
          ),
        ),
      ],
    );
  }
}
