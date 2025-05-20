import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/map/viewmodels/map_viewmodel.dart';
import 'package:icar/ui/map/widgets/icar_stop_detail.dart';
import 'package:icar/ui/map/widgets/icar_stop_marker/icar_stop_clipper.dart';

class IcarStopMarker extends ConsumerWidget {
  const IcarStopMarker({
    super.key,
    required this.color,
    required this.icarStop,
  });

  final Color color;
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
                  IcarStopDetail(icarStop: icarStop),
        );

        isShowingDetailNotifier.hideDetail();
      },
      child: ClipPath(
        clipper: IcarStopClipper(),
        child: Container(
          padding: const EdgeInsets.only(
            left: 4,
            right: 4,
            top: 4,
            bottom: 4 + 6,
          ),
          decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
          child: const AppIcon(
            iconSvg: AppIconsSvg.busStop,
            color: AppColors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
