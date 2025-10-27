import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/home/presentation/widgets/select_icar_stop_tile.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';

class SelectIcarStopHistory extends ConsumerWidget {
  const SelectIcarStopHistory({
    super.key,
    required this.icarStopOptionsFromHistory,
  });

  final List<IcarStop> icarStopOptionsFromHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeLocalizations.of(context)!.selectStopLabel('latest_search'),
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray500),
        ),
        for (final icarStopOption in icarStopOptionsFromHistory)
          SelectIcarStopTile(icarStop: icarStopOption),
        const SizedBox(height: 22),
      ],
    );
  }
}
