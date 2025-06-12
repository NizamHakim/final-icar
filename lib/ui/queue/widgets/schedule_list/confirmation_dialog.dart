import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/home/viewmodels/closest_ticket_inqueue/closest_ticket_inqueue_viewmodel.dart';
import 'package:icar/ui/queue/viewmodels/schedule_list_viewmodel.dart';
import 'package:icar/ui/queue/widgets/schedule_list/cd_tile.dart';

class ConfirmationDialog extends ConsumerWidget {
  const ConfirmationDialog({
    super.key,
    required this.schedule,
    required this.icarRoute,
    required this.icarStop,
  });

  final Schedule schedule;
  final IcarRoute icarRoute;
  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(createNewTicketProvider);
    final currentLocale = ref.watch(currentLocaleProvider);

    ref.listen(createNewTicketProvider, (previous, next) {
      if (next.hasValue &&
          !next.isLoading &&
          next.value != null &&
          context.mounted) {
        ref.invalidate(closestTicketInQueueProvider);
        Navigator.of(context).pop(next.value);
      }
    });

    Widget submitButton;

    if (ticketState.isLoading) {
      submitButton = TextButton(
        onPressed: null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularLoader(color: AppColors.primary100, size: 12),
            const SizedBox(width: 8),
            Text(
              QueueLocalizations.of(context)!.confirmJoinQueue,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.primary100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    } else {
      submitButton = TextButton(
        onPressed: () {
          ref.read(createNewTicketProvider.notifier).createTicket(schedule);
        },
        child: Text(
          QueueLocalizations.of(context)!.confirmJoinQueue,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.primary500,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        QueueLocalizations.of(context)!.confirmQueueTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CdTile(
              iconSvg: AppIconsSvg.busStop,
              text: CoreLocalizations.of(context)!.stopWithName(icarStop.name),
            ),
            CdTile(iconSvg: AppIconsSvg.route, text: icarRoute.name),
            CdTile(
              iconSvg: AppIconsSvg.clock,
              text: schedule.formattedArrivalTime(currentLocale),
            ),
            CdTile(
              iconSvg: AppIconsSvg.calendar,
              text: QueueLocalizations.of(
                context,
              )!.confirmQueueDate(schedule.formattedArrivalDate(currentLocale)),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed:
              ticketState.isLoading ? null : () => Navigator.pop(context),
          child: Text(
            CoreLocalizations.of(context)!.cancel,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color:
                  ticketState.isLoading ? AppColors.gray200 : AppColors.gray600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        submitButton,
      ],
    );
  }
}
