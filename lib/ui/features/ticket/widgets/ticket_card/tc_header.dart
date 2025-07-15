import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/locales/locales.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';
import 'package:icar/ui/widgets/text_badge.dart';

class TcHeader extends ConsumerWidget {
  const TcHeader({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            ticket.schedule!.formattedArrivalTime(currentLocale),
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
            QueueLocalizations.of(
              context,
            )!.peopleInQueue(ticket.schedule!.tickets!.length),
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
