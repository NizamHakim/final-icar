import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/domain/entities/ticket_proximity_status.dart';
import 'package:icar/src/shared/presentation/providers/tickets_proximity_map_stream.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class TicketCardInfo extends ConsumerWidget {
  const TicketCardInfo({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsProximityMap =
        ref.watch(ticketsProximityMapStreamProvider).valueOrNull;
    final infoData = getTicketInfoData(ticket, ticketsProximityMap, context);

    if (infoData == null) {
      return const SizedBox.shrink();
    }

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

TicketInfoData? getTicketInfoData(
  Ticket ticket,
  Map<int, TicketProximityStatus?>? ticketsProximityMap,
  BuildContext context,
) {
  switch (ticket.status) {
    case TicketStatus.CANCELED:
      return null;
    case TicketStatus.FINISHED:
      return TicketInfoData.fromProximityStatus(
        TicketProximityStatus.ARRIVED,
        context,
      );
    case TicketStatus.IN_QUEUE:
      if (ticketsProximityMap == null) return null;
      switch (ticketsProximityMap[ticket.id]) {
        case TicketProximityStatus.ARRIVED:
          return TicketInfoData.fromProximityStatus(
            TicketProximityStatus.ARRIVED,
            context,
          );
        case TicketProximityStatus.CLOSE:
          return TicketInfoData.fromProximityStatus(
            TicketProximityStatus.CLOSE,
            context,
          );
        case null:
          return null;
      }
  }
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

  final TicketProximityStatus? infoType;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final String title;
  final String description;

  factory TicketInfoData.fromProximityStatus(
    TicketProximityStatus? type,
    BuildContext context,
  ) {
    switch (type) {
      case TicketProximityStatus.CLOSE:
        return TicketInfoData._(
          infoType: type!,
          foregroundColor: AppColors.primary500,
          backgroundColor: AppColors.primary50,
          borderColor: AppColors.primary100,
          title: TicketLocalizations.of(context)!.ticketInfoTitle(type.name),
          description: TicketLocalizations.of(
            context,
          )!.ticketInfoDescription(type.name),
        );
      case TicketProximityStatus.ARRIVED:
        return TicketInfoData._(
          infoType: type!,
          foregroundColor: AppColors.success500,
          backgroundColor: AppColors.success50,
          borderColor: AppColors.success100,
          title: TicketLocalizations.of(context)!.ticketInfoTitle(type.name),
          description: TicketLocalizations.of(
            context,
          )!.ticketInfoDescription(type.name),
        );
      default:
        return const TicketInfoData._(
          infoType: null,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          borderColor: Colors.transparent,
          title: '',
          description: '',
        );
    }
  }
}
