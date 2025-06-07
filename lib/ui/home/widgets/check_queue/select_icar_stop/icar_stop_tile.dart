import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/home/viewmodels/icar_stop_options_viewmodel.dart';

class IcarStopTile extends ConsumerWidget {
  const IcarStopTile({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            ref.read(selectedStopProvider.notifier).setSelectedStop(icarStop);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CoreLocalizations.of(context)!.stopWithName(icarStop.name),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "${icarStop.distance}m",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "•",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const AppIcon(
                      iconSvg: AppIconsSvg.walk,
                      size: 20,
                      color: AppColors.gray400,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      CoreLocalizations.of(
                        context,
                      )!.minutes(icarStop.duration!.inMinutes),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.gray50, thickness: 1, height: 0),
      ],
    );
  }
}
