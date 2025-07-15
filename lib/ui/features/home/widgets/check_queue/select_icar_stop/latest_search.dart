import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/home/widgets/check_queue/select_icar_stop/icar_stop_tile.dart';

class LatestSearch extends ConsumerWidget {
  const LatestSearch({super.key, required this.icarStopOptionsFromHistory});

  final List<IcarStop> icarStopOptionsFromHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeLocalizations.of(context)!.stopLatestSearchLabel,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray500),
        ),
        for (final icarStopOption in icarStopOptionsFromHistory)
          IcarStopTile(icarStop: icarStopOption),
        const SizedBox(height: 22),
      ],
    );
  }
}
