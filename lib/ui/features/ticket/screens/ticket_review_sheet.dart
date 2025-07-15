import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/features/ticket/widgets/history_review/rating/rating_star.dart';
import 'package:icar/ui/features/ticket/widgets/history_review/review_and_suggestion.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/circular_loader.dart';
import 'package:icar/ui/features/queue/widgets/my_queue/queue_card.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_review_viewmodel.dart';
import 'package:icar/util/handle_error.dart';

class TicketReviewSheet extends ConsumerWidget {
  const TicketReviewSheet({super.key, required this.ticketId});

  final int ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketHistory = ref.watch(ticketHistoryProvider(ticketId));
    final isDoingReview = ref.watch(isDoingReviewProvider);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: ticketHistory.when(
        data: (ticketData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.gray100,
                  ),
                ),
                const SizedBox(height: 20),
                ..._ratingStar(ticketData),
                isDoingReview
                    ? ReviewAndSuggestion(ticket: ticketData)
                    : QueueCard(ticket: ticketData, shouldNavigate: false),
              ],
            ),
          );
        },
        error: (error, _) {
          return handleError(context, error);
        },
        loading: () {
          return const CircularLoader();
        },
      ),
    );
  }

  List<Widget> _ratingStar(Ticket ticket) {
    if (ticket.status == TicketStatus.CANCELED) {
      return const [SizedBox.shrink()];
    } else {
      return [
        RatingStar(ticket: ticket),
        const Divider(color: AppColors.gray50, thickness: 1, height: 40),
      ];
    }
  }
}
