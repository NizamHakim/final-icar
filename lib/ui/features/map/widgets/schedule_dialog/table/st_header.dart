import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/map_localizations.dart';
import 'package:icar/data/models/schedule/schedule.dart';
import 'package:icar/ui/themes/app_colors.dart';

class StHeader extends StatelessWidget {
  const StHeader({super.key, required this.session});
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
