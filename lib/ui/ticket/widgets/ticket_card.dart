import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:icar/data/models/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';
import 'package:icar/ui/ticket/widgets/ticket_clipper.dart';
import 'package:icar/ui/ticket/widgets/ticket_info.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Card(
        elevation: 6,
        child: Center(
          child: Column(
            children: [
              _TicketCardHeader(ticket: ticket),
              const DottedLine(
                lineLength: double.infinity,
                lineThickness: 3,
                dashLength: 10,
                dashColor: AppColors.gray50,
                dashGapLength: 8,
              ),
              _TicketCardBody(ticket: ticket),
              const Divider(color: AppColors.gray50, thickness: 2, height: 0),
              _TicketCardFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketCardHeader extends StatelessWidget {
  const _TicketCardHeader({required this.ticket});

  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            ticket.schedule!.formattedTime,
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
              "${ticket.schedule!.ticketCount} orang dalam antrean",
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

class _TicketCardBody extends StatelessWidget {
  const _TicketCardBody({required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Halte ${ticket.schedule!.icarStop!.name}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray900,
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
                ticket.schedule!.formattedDate,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
              ),
            ],
          ),
          const Divider(color: AppColors.gray50, thickness: 1, height: 40),
          const TicketInfo(infoType: TicketInfoType.close),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppIcon(
                iconSvg: AppIconsSvg.clock,
                size: 16,
                color: AppColors.gray400,
              ),
              Text(
                " Berlaku sampai ",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppColors.gray600),
              ),
              Text(
                "${ticket.formattedDatedMy}, ${ticket.formattedTime} WIB",
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

class _TicketCardFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.error300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "Batalkan antrean",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.error500,
            ),
          ),
        ),
      ),
    );
  }
}
