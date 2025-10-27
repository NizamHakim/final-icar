import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/presentation/providers/cancel_ticket.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/shared/presentation/widgets/circular_loader.dart';

class CancelTicketDialog extends ConsumerWidget {
  const CancelTicketDialog({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(cancelTicketProvider).isLoading;

    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        TicketLocalizations.of(context)!.cancelTicketDialogTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              TicketLocalizations.of(context)!.cancelTicketDialogDesc,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: isLoading ? null : () => context.pop(),
          child: Text(
            TicketLocalizations.of(context)!.cancelTicketDialogCancel,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: isLoading ? AppColors.gray200 : AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _submitButton(context, ref, isLoading),
      ],
    );
  }

  Widget _submitButton(BuildContext context, WidgetRef ref, bool isLoading) {
    if (isLoading) {
      return TextButton(
        onPressed: null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularLoader(color: AppColors.primary100, size: 12),
            const SizedBox(width: 8),
            Text(
              TicketLocalizations.of(context)!.cancelTicketDialogSubmit,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.error100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return TextButton(
      onPressed: () async {
        await ref.read(cancelTicketProvider.notifier).cancelTicket(ticket.id);
      },
      child: Text(
        TicketLocalizations.of(context)!.cancelTicketDialogSubmit,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: AppColors.error500,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
