import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/presentation/providers/ticket_details.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_card/ticket_card.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TicketDetailsScreen extends ConsumerWidget {
  const TicketDetailsScreen({super.key, required this.ticketId});

  final int ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketDetails = ref.watch(ticketDetailsProvider(ticketId));

    return Scaffold(
      backgroundColor: AppColors.primary600,
      appBar: AppBar(
        title: Text(TicketLocalizations.of(context)!.ticketDetailsScreenTitle),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: ticketDetails.when(
          data: (ticket) {
            return _content(context, ticket: ticket, isLoading: false);
          },
          error: (error, stackTrace) {
            return handleError(context, error, stackTrace);
          },
          loading: () {
            return _content(
              context,
              ticket: fakeTicketDetails,
              isLoading: true,
            );
          },
        ),
      ),
    );
  }

  Widget _content(
    BuildContext context, {
    required Ticket ticket,
    required bool isLoading,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      containersColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(child: TicketCard(ticket: ticket)),
        ),
      ),
    );
  }
}
