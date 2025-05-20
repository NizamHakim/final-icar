import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/home/widgets/check_queue/select_stop/stop_selector_screen.dart';
import 'package:icar/ui/home/viewmodels/home_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/cq_select.dart';
import 'package:icar/ui/home/widgets/check_queue/cq_paint.dart';
import 'package:icar/ui/home/widgets/check_queue/select_route/route_sheet.dart';
import 'package:icar/ui/queue/screens/schedule_list_screen.dart';

class CheckQueue extends ConsumerWidget {
  const CheckQueue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IcarStop? selectedStop = ref.watch(selectedStopProvider);
    IcarRoute? selectedRoute = ref.watch(selectedRouteProvider);

    return CustomPaint(
      painter: CqPaint(),
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 20,
        ),
        decoration: const BoxDecoration(color: AppColors.transparent),
        child: Card(
          elevation: 0.1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                CqSelect(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const StopSelectorScreen(),
                      ),
                    );
                  },
                  valueProvider: selectedStopProvider,
                  hintText: 'Pilih halte',
                  iconSvg: AppIconsSvg.busStop,
                  label: "Halte",
                ),
                const SizedBox(height: 10),
                CqSelect(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const RouteSheet(),
                    );
                  },
                  valueProvider: selectedRouteProvider,
                  hintText: 'Pilih rute',
                  iconSvg: AppIconsSvg.route,
                  label: "Rute",
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        (selectedStop != null && selectedRoute != null)
                            ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => ScheduleListScreen(
                                        icarStop: selectedStop,
                                        icarRoute: selectedRoute,
                                      ),
                                ),
                              );
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary600,
                      disabledBackgroundColor: AppColors.primary600.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    child: Text(
                      'Cek antrean iCar',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
