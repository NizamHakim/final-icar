import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/home/viewmodels/home_viewmodel.dart';

class StopTile extends ConsumerWidget {
  const StopTile({super.key, required this.stop});

  final IcarStop stop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            ref.read(selectedStopProvider.notifier).setSelectedStop(stop);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halte ${stop.name}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "200m",
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
                      "3 menit",
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
        const Divider(color: AppColors.gray50, thickness: 1),
      ],
    );
  }
}
