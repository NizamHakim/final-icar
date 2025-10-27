import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/shared/presentation/widgets/text_badge.dart';
import 'package:icar/src/features/schedule/presentation/widgets/confirm_schedule_dialog.dart';
import 'package:icar/src/features/schedule/presentation/widgets/success_dialog.dart';
import 'package:icar/src/utils/extension/datetime_extension.dart';
import 'package:icar/src/utils/show_snackbar.dart';

class ScheduleListTile extends ConsumerWidget {
  const ScheduleListTile({super.key, required this.schedule});

  final Schedule schedule;

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
            schedule.arrivalTime.timeHM(currentLocale),
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
            ScheduleLocalizations.of(
              context,
            )!.icarSeats(schedule.icar!.capacity),
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
        foregroundColor: schedule.icar!.icarRoute!.color,
        backgroundColor: schedule.icar!.icarRoute!.secondaryColor,
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
        ScheduleLocalizations.of(context)!.peopleInQueue(schedule.ticketCount!),
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.success500),
      );
    }

    return Text(
      ScheduleLocalizations.of(context)!.scheduleNotYetAvailable,
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
              (context) => ConfirmScheduleDialog(
                schedule: schedule,
                icarRoute: schedule.icar!.icarRoute!,
                icarStop: schedule.icarStop!,
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
        ScheduleLocalizations.of(context)!.pleaseSelectOtherSchedule,
        textColor: AppColors.white,
        backgroundColor: AppColors.error500,
        showCloseIcon: true,
      );
    };
  }
}
