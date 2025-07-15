import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/home/widgets/check_queue/select_icar_stop/icar_stop_tile.dart';

class AllOptions extends StatelessWidget {
  const AllOptions({super.key, required this.icarStopOptions});

  final List<IcarStop> icarStopOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CoreLocalizations.of(context)!.stop,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray500),
        ),
        for (final icarStopOption in icarStopOptions)
          IcarStopTile(icarStop: icarStopOption),
      ],
    );
  }
}
