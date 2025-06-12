import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/ticket/screens/ticket_history_screen.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_details_viewmodel.dart';
import 'package:icar/util/show_snackbar.dart';

class TcFooter extends ConsumerWidget {
  const TcFooter({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(cancelTicketProvider, (_, next) {
      next.when(
        data: (_) {
          // if (next.value != null) {
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => const Authorized()),
          //   );
          // }
        },
        loading: () {},
        error: (error, _) {
          showSnackBar(
            context,
            SnackBar(
              content: Text(
                error.toString(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.error500,
            ),
          );
        },
      );
    });

    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: _footerButton(context, ticket, ref),
      ),
    );
  }

  Widget _footerButton(BuildContext context, Ticket ticket, WidgetRef ref) {
    if (ticket.status == TicketStatus.IN_QUEUE) {
      return OutlinedButton(
        onPressed: () async {
          await ref.read(cancelTicketProvider.notifier).cancelTicket(ticket);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.error300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          TicketLocalizations.of(context)!.cancelTicketButtonLabel,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.error500,
          ),
        ),
      );
    }

    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TicketHistoryScreen(ticket: ticket),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        TicketLocalizations.of(context)!.ticketHistoryButtonLabel,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primary500,
        ),
      ),
    );
  }
}
