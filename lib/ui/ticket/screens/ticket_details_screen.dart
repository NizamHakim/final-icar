import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_details_viewmodel.dart';
import 'package:icar/ui/ticket/widgets/ticket_card.dart';

class TicketDetailsScreen extends ConsumerWidget {
  const TicketDetailsScreen({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketDetails = ref.watch(ticketDetailsProvider(ticket: ticket));

    return Scaffold(
      appBar: AppBar(title: const Text('Tiket Antrian'), centerTitle: true),
      body: SizedBox.expand(
        child: ticketDetails.when(
          data: (ticket) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(child: TicketCard(ticket: ticket)),
              ),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(
                'Error: $error',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularLoader(size: 16, color: AppColors.white),
            );
          },
        ),
      ),
    );
  }
}
