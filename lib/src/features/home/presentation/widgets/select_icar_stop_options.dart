import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/home/presentation/widgets/select_icar_stop_tile.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';

class SelectIcarStopOptions extends StatelessWidget {
  const SelectIcarStopOptions({super.key, required this.icarStopOptions});

  final List<IcarStop> icarStopOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeLocalizations.of(context)!.selectStopLabel('all_options'),
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray500),
        ),
        for (final icarStopOption in icarStopOptions)
          SelectIcarStopTile(icarStop: icarStopOption),
      ],
    );
  }
}
