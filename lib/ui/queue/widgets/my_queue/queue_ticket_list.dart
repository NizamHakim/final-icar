import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/queue/viewmodels/my_queue_viewmodel.dart';
import 'package:icar/ui/queue/widgets/my_queue/queue_card.dart';

class QueueTicketList extends ConsumerWidget {
  const QueueTicketList({super.key, required this.ticketStatus});

  final TicketStatus ticketStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketListByStatusProvider(ticketStatus));

    return tickets.when(
      data: (ticketsData) {
        if (ticketsData.isEmpty) {
          String message;

          if (ticketStatus == TicketStatus.IN_QUEUE) {
            message = 'Tidak ada tiket dalam antrean';
          } else if (ticketStatus == TicketStatus.CANCELED) {
            message = 'Tidak ada tiket dibatalkan';
          } else {
            message = 'Tidak ada tiket selesai';
          }

          return DataNotFetched(text: message);
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
        return DataNotFetched(text: error.toString());
      },
      loading: () {
        return const CircularLoader();
      },
    );
  }
}
