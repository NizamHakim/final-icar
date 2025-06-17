import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/map/viewmodels/map_properties/map_properties_viewmodel.dart';
import 'package:icar/ui/map/viewmodels/schedule_dialog/schedule_dialog_viewmodel.dart';
import 'package:icar/ui/map/widgets/schedule_dialog/schedule_dialog.dart';

class IcarStopMarker extends ConsumerWidget {
  const IcarStopMarker({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(flutterMapControllerProvider);
    final isShowingDetailNotifier = ref.read(isShowingDetailProvider.notifier);

    return InkWell(
      onTap: () async {
        isShowingDetailNotifier.showDetail();
        mapController!.move(icarStop.coordinate, 18);

        await showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierColor: AppColors.transparent,
          barrierLabel: '',
          pageBuilder:
              (context, animation, secondaryAnimation) =>
                  ScheduleDialog(icarStopId: icarStop.id),
        );

        isShowingDetailNotifier.hideDetail();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 28,
            padding: const EdgeInsets.only(top: 2, left: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              color: AppColors.white,
            ),
            child: Text(
              "${icarStop.id}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(width: 6, height: 10, color: AppColors.primary500),
        ],
      ),
    );
  }
}
