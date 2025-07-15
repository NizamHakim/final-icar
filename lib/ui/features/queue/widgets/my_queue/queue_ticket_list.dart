import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/widgets/data_not_fetched.dart';
import 'package:icar/ui/widgets/circular_loader.dart';
import 'package:icar/ui/features/queue/viewmodels/my_queue/my_queue_viewmodel.dart';
import 'package:icar/ui/features/queue/widgets/my_queue/queue_card.dart';
import 'package:icar/util/handle_error.dart';

class QueueTicketList extends ConsumerWidget {
  const QueueTicketList({super.key, required this.ticketStatus});

  final TicketStatus ticketStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketListByStatusProvider(ticketStatus));

    return tickets.when(
      data: (ticketsData) {
        if (ticketsData.isEmpty) {
          return DataNotFetched(
            text: QueueLocalizations.of(
              context,
            )!.noTicketsByStatus(ticketStatus.name),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.separated(
            itemCount: ticketsData.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              final ticket = ticketsData[index];
              return QueueCard(ticket: ticket);
            },
          ),
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
