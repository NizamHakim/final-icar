import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/schedule/domain/entities/schedule.dart';
import 'package:icar/src/features/schedule/presentation/providers/schedules_list.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/shared/presentation/providers/icar_route.dart';
import 'package:icar/src/shared/presentation/providers/icar_stop.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/schedule/presentation/widgets/schedule_list_tile.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ScheduleListScreen extends ConsumerWidget {
  const ScheduleListScreen({
    super.key,
    required this.icarRouteId,
    required this.icarStopId,
  });

  final int icarRouteId;
  final int icarStopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icarStop = ref.watch(icarStopProvider(icarStopId));
    final icarRoute = ref.watch(icarRouteProvider(icarRouteId));
    final scheduleList = ref.watch(
      schedulesListProvider(icarRouteId: icarRouteId, icarStopId: icarStopId),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        title: Column(
          children: [
            Skeletonizer(
              enabled: icarStop.isLoading,
              child: Text(
                icarStop.when(
                  data: (icarStopData) {
                    return icarStopData.name;
                  },
                  error: (error, _) {
                    return "-";
                  },
                  loading: () {
                    return fakeIcarStop.name;
                  },
                ),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.gray900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Skeletonizer(
              enabled: icarRoute.isLoading,
              child: Text(
                icarRoute.when(
                  data: (icarRouteData) {
                    return icarRouteData.name;
                  },
                  error: (error, _) {
                    return "-";
                  },
                  loading: () {
                    return fakeIcarRoute.name;
                  },
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
              ),
            ),
          ],
        ),
        elevation: 0.1,
        scrolledUnderElevation: 0.1,
        shadowColor: AppColors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(color: AppColors.white),
        child: scheduleList.when(
          data: (scheduleListData) {
            if (scheduleListData.isEmpty) {
              return CenteredGrayText(
                text: ScheduleLocalizations.of(context)!.noScheduleAvailable,
              );
            } else {
              return _content(
                context,
                scheduleListData: scheduleListData,
                isLoading: false,
              );
            }
          },
          error: (error, stackTrace) {
            return handleError(context, scheduleList.error!, stackTrace);
          },
          loading: () {
            return _content(
              context,
              scheduleListData: fakeSchedules,
              isLoading: true,
            );
          },
        ),
      ),
    );
  }

  Widget _content(
    BuildContext context, {
    required List<Schedule> scheduleListData,
    required bool isLoading,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(color: AppColors.gray50, thickness: 1);
        },
        itemCount: scheduleListData.length,
        itemBuilder: (context, index) {
          return ScheduleListTile(schedule: scheduleListData[index]);
        },
      ),
    );
  }
}
