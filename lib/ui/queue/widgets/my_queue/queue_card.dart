import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';
import 'package:icar/ui/ticket/screens/ticket_details_screen.dart';

class QueueCard extends StatelessWidget {
  const QueueCard({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TicketDetailsScreen(ticket: ticket),
          ),
        );
      },
      child: Card(
        elevation: 0.1,
        color: AppColors.primary500,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ticket.schedule!.formattedArrivalDate,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColors.white),
                  ),
                  TextBadge(
                    text: Text(
                      ticket.schedule!.icar!.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    icon: const AppIcon(
                      iconSvg: AppIconsSvg.carRight,
                      size: 14,
                    ),
                    foregroundColor: AppColors.warning500,
                    backgroundColor: AppColors.warning50,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ticket.schedule!.formattedArrivalTime,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray900,
                        ),
                      ),
                      TextBadge(
                        text: Text(ticket.status.name),
                        foregroundColor: AppColors.success500,
                        backgroundColor: AppColors.success50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const DottedLine(
                    lineLength: double.infinity,
                    lineThickness: 3,
                    dashLength: 10,
                    dashColor: AppColors.gray50,
                    dashGapLength: 8,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const AppIcon(
                        iconSvg: AppIconsSvg.busStop,
                        size: 16,
                        color: AppColors.primary600,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Halte ${ticket.schedule!.icarStop!.name}",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.gray600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const AppIcon(
                        iconSvg: AppIconsSvg.route,
                        size: 16,
                        color: AppColors.primary600,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ticket.schedule!.icar!.icarRoute!.name,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.gray600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
