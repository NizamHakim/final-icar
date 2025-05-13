import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/app_colors.dart';
import 'package:icar/ui/core/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/home/viewmodels/home_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/latest_search.dart';
import 'package:icar/ui/home/widgets/check_queue/stop_list.dart';

class StopSelectorScreen extends ConsumerWidget {
  const StopSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchStop = ref.watch(searchStopProvider);
    final stopStateList = ref.watch(filteredStopListProvider);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.gray400,
        backgroundColor: AppColors.white,
        elevation: 0.1,
        shadowColor: AppColors.black,
        scrolledUnderElevation: 0.1,
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: (value) {
              ref.read(searchStopProvider.notifier).setSearchValue(value);
            },
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 16, end: 12),
                child: AppIcon(iconSvg: AppIconsSvg.search, size: 22),
              ),
              contentPadding: EdgeInsets.zero,
              hintText: "Cari halte...",
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
            ),
          ),
        ),
      ),
      body: RootContainer(
        child: stopStateList.when(
          data: (stopState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (searchStop.isEmpty) const LatestSearch(),
                  StopList(stopStateList: stopState),
                ],
              ),
            );
          },
          error: (error, stackTrace) {
            return const Center(child: Text("Error loading stops"));
          },
          loading: () {
            return const Center(child: CircularLoader(size: 16));
          },
        ),
      ),
    );
  }
}
