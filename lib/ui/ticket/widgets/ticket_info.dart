import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';

class TicketInfo extends StatelessWidget {
  const TicketInfo({super.key, required this.infoType});

  final TicketInfoType infoType;

  @override
  Widget build(BuildContext context) {
    final infoData = TicketInfoData.fromType(infoType, context);

    return Container(
      padding: const EdgeInsets.all(16),
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

// ignore: constant_identifier_names
enum TicketInfoType { CLOSE, ARRIVED }

class TicketInfoData {
  const TicketInfoData._({
    required this.infoType,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.title,
    required this.description,
  });

  final TicketInfoType infoType;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final String title;
  final String description;

  factory TicketInfoData.fromType(TicketInfoType type, BuildContext context) {
    switch (type) {
      case TicketInfoType.CLOSE:
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
      case TicketInfoType.ARRIVED:
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
    }
  }
}
