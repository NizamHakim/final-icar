import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/features/ticket/presentation/providers/review_ticket.dart';
import 'package:icar/src/features/ticket/presentation/providers/ticket_details.dart';
import 'package:icar/src/features/ticket/presentation/widgets/review/review_rating.dart';
import 'package:icar/src/features/ticket/presentation/widgets/review/review.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_queue_card.dart';
import 'package:icar/src/shared/presentation/widgets/circular_loader.dart';
import 'package:icar/src/utils/handle_error.dart';

class TicketReviewSheet extends ConsumerWidget {
  const TicketReviewSheet({super.key, required this.ticketId});

  final int ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketHistory = ref.watch(ticketDetailsProvider(ticketId));
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
                    ? Review(ticket: ticketData)
                    : TicketQueueCard(ticket: ticketData, onTap: null),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return handleError(context, error, stackTrace);
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
        ReviewRating(ticket: ticket),
        const Divider(color: AppColors.gray50, thickness: 1, height: 40),
      ];
    }
  }
}
