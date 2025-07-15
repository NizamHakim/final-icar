import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';
import 'package:icar/ui/widgets/circular_loader.dart';
import 'package:icar/ui/features/map/viewmodels/schedule_dialog/schedule_dialog_viewmodel.dart';
import 'package:icar/util/handle_error.dart';
import 'package:icar/ui/features/map/widgets/schedule_dialog/sd_content.dart';
import 'package:icar/ui/features/map/widgets/schedule_dialog/sd_divider.dart';
import 'package:icar/ui/features/map/widgets/schedule_dialog/sd_header.dart';

class ScheduleDialog extends ConsumerWidget {
  const ScheduleDialog({super.key, required this.icarStopId});

  final int icarStopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icarStopDetail = ref.watch(icarStopDetailProvider(icarStopId));
    final icarList = ref.watch(icarWithSchedulesListProvider(icarStopId));

    Widget content;

    if (icarStopDetail.isLoading || icarList.isLoading) {
      content = const CircularLoader();
    } else if (icarStopDetail.hasError) {
      content = handleError(context, icarStopDetail.error!);
    } else if (icarList.hasError) {
      content = handleError(context, icarList.error!);
    } else {
      content = Column(
        children: [
          SdHeader(icarStop: icarStopDetail.asData!.value),
          const SdDivider(),
          SdContent(icarList: icarList.asData!.value),
        ],
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const IgnorePointer(
              child: Card(
                color: AppColors.white,
                elevation: 6,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppIcon(
                    iconSvg: AppIconsSvg.xClose,
                    color: AppColors.gray700,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Card(
              elevation: 6,
              shadowColor: AppColors.gray50,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 100),
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
