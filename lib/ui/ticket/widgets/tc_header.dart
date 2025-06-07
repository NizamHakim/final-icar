import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';

class TcHeader extends StatelessWidget {
  const TcHeader({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            ticket.schedule!.formattedArrivalTime,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 60,
              fontWeight: FontWeight.w700,
              color: AppColors.primary600,
            ),
          ),
          const SizedBox(height: 10),
          TextBadge(
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
          ),
        ],
      ),
    );
  }
}
