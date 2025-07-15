import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/locales/locales.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';
import 'package:icar/ui/widgets/text_badge.dart';
import 'package:icar/ui/features/ticket/widgets/ticket_card/ticket_info.dart';

class TcBody extends ConsumerWidget {
  const TcBody({super.key, required this.ticket});

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
                  CoreLocalizations.of(
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
                ticket.schedule!.formattedArrivalDate(currentLocale),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
              ),
            ],
          ),
          const Divider(color: AppColors.gray50, thickness: 1, height: 40),
          TicketInfo(ticket: ticket),
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
                "${ticket.formattedExpiredDate2}, ${ticket.formattedExpiredTime} WIB",
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
