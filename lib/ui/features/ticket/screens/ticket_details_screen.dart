import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/circular_loader.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_details_viewmodel.dart';
import 'package:icar/ui/features/ticket/widgets/ticket_card/ticket_card.dart';
import 'package:icar/util/handle_error.dart';

class TicketDetailsScreen extends ConsumerWidget {
  const TicketDetailsScreen({super.key, required this.ticketId});

  final int ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketDetails = ref.watch(ticketDetailsProvider(ticketId));

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
            return handleError(context, error);
          },
          loading: () {
            return const CircularLoader(color: AppColors.white);
          },
        ),
      ),
    );
  }
}
