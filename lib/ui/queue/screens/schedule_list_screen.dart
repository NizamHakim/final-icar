import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/queue/viewmodels/schedule_list_viewmodel.dart';
import 'package:icar/ui/queue/widgets/schedule_list/sl_tile.dart';

class ScheduleListScreen extends ConsumerWidget {
  const ScheduleListScreen({
    super.key,
    required this.icarRoute,
    required this.icarStop,
  });

  final IcarRoute icarRoute;
  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleList = ref.watch(
      scheduleListProvider(icarRoute: icarRoute, icarStop: icarStop),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        title: Column(
          children: [
            Text(
              CoreLocalizations.of(context)!.stopWithName(icarStop.name),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.gray900,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              icarRoute.name,
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
        child: scheduleList.when(
          data: (scheduleListData) {
            if (scheduleListData.isEmpty) {
              return DataNotFetched(
                text: QueueLocalizations.of(context)!.noScheduleAvailable,
              );
            }

            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(color: AppColors.gray50, thickness: 1);
              },
              itemCount: scheduleListData.length,
              itemBuilder: (context, index) {
                return SlTile(
                  schedule: scheduleListData[index],
                  icarRoute: icarRoute,
                  icarStop: icarStop,
                );
              },
            );
          },
          error: (error, _) {
            return DataNotFetched(
              text: CoreLocalizations.of(context)!.internalServerError,
            );
          },
          loading: () {
            return const CircularLoader();
          },
        ),
      ),
    );
  }
}
