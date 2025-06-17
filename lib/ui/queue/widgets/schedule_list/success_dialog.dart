import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/root/authorized.dart';
import 'package:icar/ui/ticket/screens/ticket_details_screen.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: AppColors.white,
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.success100,
          border: Border.all(width: 8, color: AppColors.success50),
        ),
        child: const AppIcon(
          iconSvg: AppIconsSvg.checkCircle,
          size: 20,
          color: AppColors.success500,
        ),
      ),
      content: SizedBox(
        width: screenWidth * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                QueueLocalizations.of(context)!.successQueueNotification,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              QueueLocalizations.of(context)!.successQueueDescription,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.gray500,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Authorized()),
              (route) => route.isFirst,
            );
          },
          child: Text(
            CoreLocalizations.of(context)!.bottomNavHome,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TicketDetailsScreen(ticketId: ticket.id),
              ),
            );
          },
          child: Text(
            QueueLocalizations.of(context)!.successQueueTicket,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
