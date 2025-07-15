import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/core/providers/geofencing_tickets_inqueue/geofencing_tickets_inqueue.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';

class TicketInfo extends ConsumerWidget {
  const TicketInfo({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geofencingTicketsInQueue =
        ref.watch(geofencingTicketsInQueueProvider).valueOrNull;

    if (shouldHideTicketInfo(ticket, geofencingTicketsInQueue)) {
      return const SizedBox.shrink();
    }

    final infoData = getTicketInfoData(
      ticket,
      geofencingTicketsInQueue,
      context,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: infoData.borderColor),
        borderRadius: BorderRadius.circular(8),
        color: infoData.backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(
            iconSvg: AppIconsSvg.infoCircle,
            color: infoData.foregroundColor,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoData.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: infoData.foregroundColor,
                  ),
                ),
                // this part overflows
                Text(
                  infoData.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: infoData.foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool shouldHideTicketInfo(
  Ticket ticket,
  Map<int, TicketDistanceStatus>? geofencingTicketsInQueue,
) {
  if (ticket.status == TicketStatus.CANCELED) {
    return true;
  }

  if (ticket.status == TicketStatus.FINISHED) {
    return false;
  }

  if (geofencingTicketsInQueue == null) {
    return true;
  }

  final distanceStatus = geofencingTicketsInQueue[ticket.id];
  return distanceStatus == null ||
      distanceStatus == TicketDistanceStatus.NOTHING;
}

TicketInfoData getTicketInfoData(
  Ticket ticket,
  Map<int, TicketDistanceStatus>? geofencingTicketsInQueue,
  BuildContext context,
) {
  if (ticket.status == TicketStatus.FINISHED) {
    return TicketInfoData.fromType(TicketDistanceStatus.ARRIVED, context);
  }

  return TicketInfoData.fromType(
    geofencingTicketsInQueue![ticket.id]!,
    context,
  );
}

class TicketInfoData {
  const TicketInfoData._({
    required this.infoType,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.title,
    required this.description,
  });

  final TicketDistanceStatus infoType;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final String title;
  final String description;

  factory TicketInfoData.fromType(
    TicketDistanceStatus type,
    BuildContext context,
  ) {
    switch (type) {
      case TicketDistanceStatus.CLOSE:
        return TicketInfoData._(
          infoType: type,
          foregroundColor: AppColors.primary500,
          backgroundColor: AppColors.primary50,
          borderColor: AppColors.primary100,
          title: TicketLocalizations.of(context)!.ticketInfoTitle(type.name),
          description: TicketLocalizations.of(
            context,
          )!.ticketInfoDescription(type.name),
        );
      case TicketDistanceStatus.ARRIVED:
        return TicketInfoData._(
          infoType: type,
          foregroundColor: AppColors.success500,
          backgroundColor: AppColors.success50,
          borderColor: AppColors.success100,
          title: TicketLocalizations.of(context)!.ticketInfoTitle(type.name),
          description: TicketLocalizations.of(
            context,
          )!.ticketInfoDescription(type.name),
        );
      case TicketDistanceStatus.NOTHING:
        return TicketInfoData._(
          infoType: type,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          borderColor: Colors.transparent,
          title: '',
          description: '',
        );
    }
  }
}
