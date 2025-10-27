import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/features/map/presentation/providers/icars_with_schedules.dart';
import 'package:icar/src/shared/presentation/providers/icar_stop.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_dialog/schedule_dialog_content.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_dialog/schedule_dialog_divider.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_dialog/schedule_dialog_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ScheduleDialog extends ConsumerWidget {
  const ScheduleDialog({super.key, required this.icarStopId});

  final int icarStopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icarStop = ref.watch(icarStopProvider(icarStopId));
    final icarsList = ref.watch(icarsWithSchedulesProvider(icarStopId));

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
                child: Column(
                  children: [
                    icarStop.when(
                      data: (icarStopDetailData) {
                        return ScheduleDialogHeader(
                          icarStop: icarStopDetailData,
                        );
                      },
                      error: (error, stackTrace) {
                        return handleError(context, error, stackTrace);
                      },
                      loading: () {
                        return Skeletonizer(
                          enabled: true,
                          containersColor: AppColors.white,
                          child: ScheduleDialogHeader(icarStop: fakeIcarStop),
                        );
                      },
                    ),
                    const ScheduleDialogDivider(),
                    icarsList.when(
                      data: (icarListData) {
                        return ScheduleDialogContent(icarList: icarListData);
                      },
                      error: (error, stackTrace) {
                        return handleError(context, error, stackTrace);
                      },
                      loading: () {
                        return Skeletonizer(
                          child: ScheduleDialogContent(
                            icarList: fakeIcarsWithSchedules,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
