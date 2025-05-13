import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/app_colors.dart';
import 'package:icar/ui/home/viewmodels/home_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/stop_tile.dart';

class StopList extends ConsumerWidget {
  const StopList({super.key, required this.stopStateList});

  final List<StopState> stopStateList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Halte",
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: AppColors.gray500),
        ),
        ...List.generate(
          stopStateList.length,
          (index) => StopTile(
            stop: stopStateList[index].stop,
            visible: stopStateList[index].visible,
            onTap: () {
              ref
                  .read(selectedStopProvider.notifier)
                  .setSelectedStop(stopStateList[index].stop);
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
