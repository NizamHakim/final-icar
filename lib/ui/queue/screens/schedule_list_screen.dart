import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/queue/viewmodels/schedule_list_viewmodel.dart';
import 'package:icar/ui/queue/widgets/sl_tile.dart';

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
              "Halte ${icarStop.name}",
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
          data: (schedules) {
            if (schedules.isEmpty) {
              return const Center(child: Text('Tidak ada jadwal antrean'));
            }

            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(color: AppColors.gray100, thickness: 1);
              },
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return SlTile(
                  schedule: schedule,
                  icarRoute: icarRoute,
                  icarStop: icarStop,
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text('$error'));
          },
          loading: () {
            return const Center(child: CircularLoader());
          },
        ),
      ),
    );
  }
}
