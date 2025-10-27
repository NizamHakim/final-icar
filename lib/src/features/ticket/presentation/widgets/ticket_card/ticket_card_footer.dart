import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/ticket/presentation/widgets/cancel_ticket_dialog.dart';

class TicketCardFooter extends ConsumerWidget {
  const TicketCardFooter({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: _footerButton(context, ref, ticket),
      ),
    );
  }

  Widget _footerButton(BuildContext context, WidgetRef ref, Ticket ticket) {
    if (ticket.status == TicketStatus.IN_QUEUE) {
      return OutlinedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CancelTicketDialog(ticket: ticket),
          );
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
      onPressed: () => context.go("/tickets/${ticket.id}/review"),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        TicketLocalizations.of(context)!.reviewTicketButtonLabel,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primary500,
        ),
      ),
    );
  }
}
