import 'package:flutter/material.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule_session.dart';
import 'package:icar/src/l10n/generated/map_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class ScheduleTableHeader extends StatelessWidget {
  const ScheduleTableHeader({super.key, required this.session});
  final ScheduleSession session;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray100, width: 1)),
        color: AppColors.gray50,
      ),
      child: Center(
        child: Text(
          MapLocalizations.of(context)!.session(session.name),
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray700),
        ),
      ),
    );
  }
}
