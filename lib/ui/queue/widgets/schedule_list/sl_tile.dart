import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/providers/locales/locales.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';
import 'package:icar/ui/queue/widgets/schedule_list/confirmation_dialog.dart';
import 'package:icar/ui/queue/widgets/schedule_list/success_dialog.dart';
import 'package:icar/util/show_snackbar.dart';

class SlTile extends ConsumerWidget {
  const SlTile({
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
    final currentLocale = ref.watch(currentLocaleProvider);

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _scheduleStatusBadge(context, schedule),
          const SizedBox(height: 4),
          Text(
            schedule.formattedArrivalTime(currentLocale),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.gray900,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          _scheduleDescription(context, schedule),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            QueueLocalizations.of(context)!.icarSeats(schedule.icar!.capacity),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
          ),
        ],
      ),
      onTap: _onTap(schedule, context),
    );
  }

  Widget _scheduleStatusBadge(BuildContext context, Schedule schedule) {
    if (schedule.isEnabled) {
      return TextBadge(
        text: Text(
          schedule.icar!.name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        foregroundColor: icarRoute.color,
        backgroundColor: icarRoute.secondaryColor,
        icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
      );
    }

    return TextBadge(
      text: Text(
        schedule.icar!.name,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      foregroundColor: AppColors.gray300,
      backgroundColor: AppColors.gray50,
      icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
    );
  }

  Widget _scheduleDescription(BuildContext context, Schedule schedule) {
    if (schedule.isEnabled) {
      return Text(
        QueueLocalizations.of(context)!.peopleInQueue(schedule.tickets!.length),
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.success500),
      );
    }

    return Text(
      QueueLocalizations.of(context)!.scheduleNotYetAvailable,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
    );
  }

  VoidCallback _onTap(Schedule schedule, BuildContext context) {
    if (schedule.isEnabled) {
      return () async {
        final newTicket = await showDialog<Ticket?>(
          context: context,
          builder:
              (context) => ConfirmationDialog(
                schedule: schedule,
                icarRoute: icarRoute,
                icarStop: icarStop,
              ),
        );
        if (newTicket != null) {
          if (!context.mounted) return;
          showDialog(
            context: context,
            builder: (context) => SuccessDialog(ticket: newTicket),
          );
        }
      };
    }

    return () {
      showSnackBar(
        context,
        SnackBar(
          content: Text(
            QueueLocalizations.of(context)!.pleaseSelectOtherSchedule,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.error500,
          showCloseIcon: true,
        ),
      );
    };
  }
}
