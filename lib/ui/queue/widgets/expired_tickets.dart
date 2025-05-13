import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/queue/viewmodels/my_queue_viewmodel.dart';
import 'package:icar/ui/queue/widgets/queue_card.dart';

class ExpiredTickets extends ConsumerWidget {
  const ExpiredTickets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(getExpiredTicketsProvider);

    return tickets.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('Tidak ada tiket selesai'));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              final ticket = data[index];
              return QueueCard(ticket: ticket);
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            'Error: $error',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      },
      loading: () {
        return const Center(child: CircularLoader(size: 16));
      },
    );
  }
}
