import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/queue/viewmodels/my_queue_viewmodel.dart';
import 'package:icar/ui/queue/widgets/queue_card.dart';

class InQueueTickets extends ConsumerWidget {
  const InQueueTickets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(inQueueTicketsProvider);

    return tickets.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(
            child: Text(
              'Tidak ada tiket dalam antrean',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.gray300,
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.gray300,
            ),
          ),
        );
      },
      loading: () {
        return const Center(child: CircularLoader(size: 16));
      },
    );
  }
}
