import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/profile/presentation/providers/current_locale.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_card/ticket_card_info.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/shared/presentation/widgets/text_badge.dart';
import 'package:icar/src/utils/extension/datetime_extension.dart';

class TicketCardBody extends ConsumerWidget {
  const TicketCardBody({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  SharedLocalizations.of(
                    context,
                  )!.stopWithName(ticket.schedule!.icarStop!.name),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
              ),
              TextBadge(
                text: Text(
                  ticket.schedule!.icar!.name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
                foregroundColor: AppColors.warning500,
                backgroundColor: AppColors.warning50,
              ),
            ],
          ),
          const Divider(color: AppColors.gray50, thickness: 1, height: 40),
          Row(
            children: [
              const AppIcon(
                iconSvg: AppIconsSvg.route,
                color: AppColors.primary600,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                ticket.schedule!.icar!.icarRoute!.name,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const AppIcon(
                iconSvg: AppIconsSvg.calendar,
                color: AppColors.primary600,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                ticket.arrivedAt.dateEDMY(currentLocale),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
              ),
            ],
          ),
          const Divider(color: AppColors.gray50, thickness: 1, height: 40),
          TicketCardInfo(ticket: ticket),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppIcon(
                iconSvg: AppIconsSvg.clock,
                size: 16,
                color: AppColors.gray400,
              ),
              Text(
                TicketLocalizations.of(context)!.expiredAt,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppColors.gray600),
              ),
              Text(
                "${ticket.expiredAt.dateDMY(currentLocale)}, ${ticket.expiredAt.timeHM(currentLocale)} WIB",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.gray600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
