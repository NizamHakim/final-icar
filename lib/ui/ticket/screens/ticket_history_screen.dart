import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/queue/widgets/my_queue/queue_card.dart';
import 'package:icar/ui/ticket/widgets/history_review/rating/rating_star.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_history_viewmodel.dart';
import 'package:icar/ui/ticket/widgets/history_review/review_and_suggestion.dart';
import 'package:icar/util/handle_error.dart';

class TicketHistoryScreen extends ConsumerWidget {
  const TicketHistoryScreen({super.key, required this.ticketId});

  final int ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketHistory = ref.watch(ticketHistoryProvider(ticketId));
    final isDoingReview = ref.watch(isDoingReviewProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        elevation: 0.1,
        shadowColor: AppColors.black,
        scrolledUnderElevation: 0.1,
        title: Text(
          TicketLocalizations.of(context)!.queueHistoryScreenTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: RootContainer(
        child: ticketHistory.when(
          data: (ticketData) {
            return SingleChildScrollView(
              child: Column(
                children: [
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
