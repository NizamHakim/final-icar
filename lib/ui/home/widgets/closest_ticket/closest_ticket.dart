import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/root/bottom_nav_index/bottom_nav_index.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/home/viewmodels/closest_ticket_inqueue/closest_ticket_inqueue_viewmodel.dart';
import 'package:icar/ui/queue/widgets/my_queue/queue_card.dart';
import 'package:icar/util/handle_error.dart';

class ClosestTicket extends ConsumerWidget {
  const ClosestTicket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closestTicketInQueue = ref.watch(closestTicketInQueueProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              QueueLocalizations.of(context)!.myQueueScreenTitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(bottomNavIndexProvider.notifier).set(1);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    HomeLocalizations.of(context)!.viewAll,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray600,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const AppIcon(
                    iconSvg: AppIconsSvg.chevronRight,
                    size: 20,
                    color: AppColors.gray600,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        closestTicketInQueue.when(
          data: (closestTicketInQueueData) {
            if (closestTicketInQueueData == null) {
              return DottedBorder(
                dashPattern: const [10, 6],
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: AppColors.gray200,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: AppColors.white,
                  child: DataNotFetched(
                    text: HomeLocalizations.of(context)!.noUpcomingQueue,
                  ),
                ),
              );
            }
            return QueueCard(ticket: closestTicketInQueueData);
          },
          error: (error, _) {
            return DottedBorder(
              dashPattern: const [10, 6],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              color: AppColors.gray200,
              child: Container(
                height: 200,
                width: double.infinity,
                color: AppColors.white,
                child: handleError(context, error),
              ),
            );
          },
          loading: () {
            return const SizedBox(
              width: double.infinity,
              height: 200,
              child: CircularLoader(),
            );
          },
        ),
      ],
    );
  }
}
