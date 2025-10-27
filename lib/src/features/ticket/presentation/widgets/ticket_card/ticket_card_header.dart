import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/shared/presentation/widgets/text_badge.dart';
import 'package:icar/src/utils/extension/datetime_extension.dart';

class TicketCardHeader extends ConsumerWidget {
  const TicketCardHeader({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            ticket.schedule!.arrivalTime.timeHM(currentLocale),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 60,
              fontWeight: FontWeight.w700,
              color: AppColors.primary600,
            ),
          ),
          const SizedBox(height: 10),
          _badge(context, ticket.status),
        ],
      ),
    );
  }

  Widget _badge(BuildContext context, TicketStatus ticketStatus) {
    switch (ticketStatus) {
      case TicketStatus.IN_QUEUE:
        return TextBadge(
          icon: const AppIcon(
            iconSvg: AppIconsSvg.people,
            size: 14,
            color: AppColors.primary500,
          ),
          text: Text(
            ScheduleLocalizations.of(
              context,
            )!.peopleInQueue(ticket.schedule!.ticketCount!),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          foregroundColor: AppColors.primary500,
          backgroundColor: AppColors.primary50,
        );
      case TicketStatus.CANCELED:
        return TextBadge(
          text: Text(
            TicketLocalizations.of(context)!.queueTicketCanceled,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          foregroundColor: AppColors.error500,
          backgroundColor: AppColors.error50,
        );
      case TicketStatus.FINISHED:
        return TextBadge(
          text: Text(
            TicketLocalizations.of(context)!.icarHasArrived,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          foregroundColor: AppColors.success500,
          backgroundColor: AppColors.success50,
        );
    }
  }
}
