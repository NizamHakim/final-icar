import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';

enum TicketInfoType {
  close(
    foregroundColor: AppColors.primary500,
    backgroundColor: AppColors.primary50,
    borderColor: AppColors.primary100,
    title: "iCar sudah dekat!",
    text: "iCar sampai dalam beberapa menit. Ayo pergi ke halte!",
  ),
  arrived(
    foregroundColor: AppColors.success500,
    backgroundColor: AppColors.success50,
    borderColor: AppColors.success100,
    title: "iCar tiba di halte!",
    text: "Ayo naik iCar atau antre di waktu lain kalau iCar penuh.",
  );

  const TicketInfoType({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.title,
    required this.text,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final String title;
  final String text;
}

class TicketInfo extends StatelessWidget {
  const TicketInfo({super.key, required this.infoType});

  final TicketInfoType infoType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: infoType.borderColor),
        borderRadius: BorderRadius.circular(8),
        color: infoType.backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(
            iconSvg: AppIconsSvg.infoCircle,
            color: infoType.foregroundColor,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoType.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: infoType.foregroundColor,
                  ),
                ),
                // this part overflows
                Text(
                  infoType.text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: infoType.foregroundColor,
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
