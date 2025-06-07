import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/home/viewmodels/icar_route_options_viewmodel.dart';
import 'package:icar/ui/home/viewmodels/icar_stop_options_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/select_icar_stop/select_icar_stop_screen.dart';
import 'package:icar/ui/home/widgets/check_queue/cq_select.dart';
import 'package:icar/ui/home/widgets/check_queue/cq_paint.dart';
import 'package:icar/ui/home/widgets/check_queue/select_route/select_icar_route_sheet.dart';
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
                        builder: (context) => const SelectIcarStopScreen(),
                      ),
                    );
                  },
                  value:
                      selectedStop != null
                          ? CoreLocalizations.of(
                            context,
                          )!.stopWithName(selectedStop.name)
                          : null,
                  hintText: HomeLocalizations.of(context)!.cqSelectStopHint,
                  iconSvg: AppIconsSvg.busStop,
                  label: HomeLocalizations.of(context)!.cqSelectStopLabel,
                ),
                const SizedBox(height: 10),
                CqSelect(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const SelectIcarRouteSheet(),
                    );
                  },
                  value: selectedRoute?.name,
                  hintText: HomeLocalizations.of(context)!.cqSelectRouteHint,
                  iconSvg: AppIconsSvg.route,
                  label: HomeLocalizations.of(context)!.cqSelectRouteLabel,
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
                      HomeLocalizations.of(context)!.cqSubmitButton,
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
