import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/queue/viewmodels/schedule_list/schedule_list_viewmodel.dart';
import 'package:icar/ui/queue/widgets/schedule_list/sl_tile.dart';
import 'package:icar/util/handle_error.dart';

class ScheduleListScreen extends ConsumerWidget {
  const ScheduleListScreen({
    super.key,
    required this.icarRouteId,
    required this.icarRouteName,
    required this.icarStopId,
    required this.icarStopName,
  });

  final int icarRouteId;
  final String icarRouteName;
  final int icarStopId;
  final String icarStopName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icarStop = ref.watch(icarStopProvider(icarStopId));
    final icarRoute = ref.watch(icarRouteProvider(icarRouteId));
    final scheduleList = ref.watch(
      scheduleListProvider(icarRouteId: icarRouteId, icarStopId: icarStopId),
    );

    Widget content;

    if (icarStop.isLoading || icarRoute.isLoading || scheduleList.isLoading) {
      content = const CircularLoader();
    } else if (icarStop.hasError) {
      content = handleError(context, icarStop.error!);
    } else if (icarRoute.hasError) {
      content = handleError(context, icarRoute.error!);
    } else if (scheduleList.hasError) {
      content = handleError(context, scheduleList.error!);
    } else {
      final icarStopData = icarStop.asData!.value;
      final icarRouteData = icarRoute.asData!.value;
      final scheduleListData = scheduleList.asData!.value;

      if (scheduleListData.isEmpty) {
        content = DataNotFetched(
          text: QueueLocalizations.of(context)!.noScheduleAvailable,
        );
      } else {
        content = ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(color: AppColors.gray50, thickness: 1);
          },
          itemCount: scheduleListData.length,
          itemBuilder: (context, index) {
            return SlTile(
              schedule: scheduleListData[index],
              icarRoute: icarRouteData,
              icarStop: icarStopData,
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        title: Column(
          children: [
            Text(
              CoreLocalizations.of(context)!.stopWithName(icarStopName),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.gray900,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              icarRouteName,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray400),
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
        child: content,
      ),
    );
  }
}
