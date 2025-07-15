import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/circular_loader.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_details_viewmodel.dart';
import 'package:icar/util/http/post_response_handler.dart';
import 'package:icar/util/show_review_sheet.dart';
import 'package:icar/util/show_snackbar.dart';

class CancelTicketDialog extends ConsumerWidget {
  const CancelTicketDialog({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(cancelTicketProvider).isLoading;

    ref.listen(cancelTicketProvider, (_, next) {
      postResponseHandler(
        context,
        next,
        onSuccess: () {
          Navigator.pop(context);
          showReviewSheet(context, next.value!.id);
        },
        onError: () {
          showSnackBar(
            context,
            SnackBar(
              content: Text(
                CoreLocalizations.of(context)!.internalServerError,
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
          onPressed: isLoading ? null : () => Navigator.pop(context),
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
