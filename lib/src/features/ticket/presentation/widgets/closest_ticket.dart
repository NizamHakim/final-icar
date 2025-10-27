import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:icar/src/features/ticket/presentation/providers/closest_ticket.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_queue_card.dart';
import 'package:icar/src/utils/handle_error.dart';

class ClosestTicket extends ConsumerWidget {
  const ClosestTicket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closestTicket = ref.watch(closestTicketProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TicketLocalizations.of(context)!.myQueueScreenTitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
            GestureDetector(
              onTap: () => context.go("/tickets"),
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
        closestTicket.when(
          data: (closestTicketData) {
            return _content(
              context,
              closestTicket: closestTicketData,
              isLoading: false,
            );
          },
          error: (error, stackTrace) {
            return DottedBorder(
              dashPattern: const [10, 6],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              color: AppColors.gray200,
              child: Container(
                height: 200,
                width: double.infinity,
                color: AppColors.white,
                child: handleError(context, error, stackTrace),
              ),
            );
          },
          loading: () {
            return _content(
              context,
              closestTicket: fakeTicket,
              isLoading: true,
            );
          },
        ),
      ],
    );
  }

  Widget _content(
    BuildContext context, {
    required Ticket? closestTicket,
    required bool isLoading,
  }) {
    if (closestTicket == null) {
      return DottedBorder(
        dashPattern: const [10, 6],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: AppColors.gray200,
        child: Container(
          height: 200,
          width: double.infinity,
          color: AppColors.white,
          child: CenteredGrayText(
            text: HomeLocalizations.of(context)!.noUpcomingTicket,
          ),
        ),
      );
    }
    return Skeletonizer(
      enabled: isLoading,
      ignoreContainers: true,
      child: TicketQueueCard(
        ticket: closestTicket,
        onTap: () => context.go("/home/${closestTicket.id}"),
      ),
    );
  }
}
