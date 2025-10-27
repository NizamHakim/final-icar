import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

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
                ScheduleLocalizations.of(context)!.successJoinQueueNotification,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              ScheduleLocalizations.of(context)!.successJoinQueueDescription,
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
          onPressed: () => context.go("/home"),
          child: Text(
            SharedLocalizations.of(context)!.bottomNavHome,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () => context.go("/home/${ticket.id}"),
          child: Text(
            ScheduleLocalizations.of(context)!.successQueueTicket,
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
