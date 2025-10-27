import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/notification/presentation/providers/check_for_notification_permission.dart';
import 'package:icar/src/features/notification/presentation/widgets/notification_permission_disabled_dialog.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/ticket/presentation/providers/create_ticket.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/presentation/widgets/circular_loader.dart';
import 'package:icar/src/features/schedule/presentation/widgets/confirm_schedule_tile.dart';
import 'package:icar/src/utils/extension/datetime_extension.dart';
import 'package:icar/src/utils/networks/post_response_handler.dart';

class ConfirmScheduleDialog extends ConsumerWidget {
  const ConfirmScheduleDialog({
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
    final isLoading = ref.watch(createTicketProvider).isLoading;
    final currentLocale = ref.watch(currentLocaleProvider);

    ref.listen(createTicketProvider, (_, next) {
      postResponseHandler(
        context,
        next,
        onSuccess: () => context.pop(next.value),
      );
    });

    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        ScheduleLocalizations.of(context)!.confirmJoinQueueTitle,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(color: AppColors.black),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConfirmScheduleTile(
              iconSvg: AppIconsSvg.busStop,
              text: SharedLocalizations.of(
                context,
              )!.stopWithName(icarStop.name),
            ),
            ConfirmScheduleTile(
              iconSvg: AppIconsSvg.route,
              text: icarRoute.name,
            ),
            ConfirmScheduleTile(
              iconSvg: AppIconsSvg.clock,
              text: schedule.arrivalTime.timeHM(currentLocale),
            ),
            ConfirmScheduleTile(
              iconSvg: AppIconsSvg.calendar,
              text: ScheduleLocalizations.of(context)!.confirmJoinQueueDate(
                schedule.arrivalTime.dateEDMY(currentLocale),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: isLoading ? null : () => context.pop(),
          child: Text(
            SharedLocalizations.of(context)!.cancel,
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
              ScheduleLocalizations.of(context)!.confirmJoinQueueButtonLabel,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.primary100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return TextButton(
      onPressed: () async {
        if (!await checkForNotificationPermission()) {
          if (!context.mounted) return;
          await showDialog(
            context: context,
            builder: (context) => const NotificationPermissionDisabledDialog(),
          );
        }
        await ref.read(createTicketProvider.notifier).createTicket(schedule.id);
      },
      child: Text(
        ScheduleLocalizations.of(context)!.confirmJoinQueueButtonLabel,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: AppColors.primary500,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
