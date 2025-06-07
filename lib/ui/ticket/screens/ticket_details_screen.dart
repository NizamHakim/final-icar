import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
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
      backgroundColor: AppColors.primary600,
      appBar: AppBar(
        title: Text(TicketLocalizations.of(context)!.ticketDetailScreenTitle),
        centerTitle: true,
      ),
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
          error: (error, _) {
            return DataNotFetched(
              text: CoreLocalizations.of(context)!.internalServerError,
            );
          },
          loading: () {
            return const CircularLoader(color: AppColors.white);
          },
        ),
      ),
    );
  }
}
