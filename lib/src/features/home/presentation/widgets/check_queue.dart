import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/home/presentation/providers/selected_icar_route.dart';
import 'package:icar/src/features/home/presentation/providers/selected_icar_stop.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/features/home/presentation/widgets/check_queue_select.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';

class CheckQueue extends ConsumerWidget {
  const CheckQueue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IcarStop? selectedStop = ref.watch(selectedIcarStopProvider);
    IcarRoute? selectedRoute = ref.watch(selectedIcarRouteProvider);

    return CustomPaint(
      painter: _CheckQueuePaint(),
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
                CheckQueueSelect(
                  onTap: () => context.go("/home/selectstop"),
                  value:
                      selectedStop != null
                          ? SharedLocalizations.of(
                            context,
                          )!.stopWithName(selectedStop.name)
                          : null,
                  hintText: HomeLocalizations.of(
                    context,
                  )!.checkQueueHint('stop'),
                  iconSvg: AppIconsSvg.busStop,
                  label: HomeLocalizations.of(context)!.checkQueueLabel('stop'),
                ),
                const SizedBox(height: 10),
                CheckQueueSelect(
                  onTap: () => context.go("/home/selectroute"),
                  value: selectedRoute?.name,
                  hintText: HomeLocalizations.of(
                    context,
                  )!.checkQueueHint('route'),
                  iconSvg: AppIconsSvg.route,
                  label: HomeLocalizations.of(
                    context,
                  )!.checkQueueLabel('route'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        (selectedStop != null && selectedRoute != null)
                            ? () {
                              context.go(
                                "/home/schedules?icarStopId=${selectedStop.id}&icarRouteId=${selectedRoute.id}",
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
                      HomeLocalizations.of(context)!.checkQueueSubmitButton,
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

class _CheckQueuePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = AppColors.white;
    paint.style = PaintingStyle.fill;

    double radius = 60;
    final path = Path();

    path.moveTo(0, size.height * 0.5);
    path.arcToPoint(
      Offset(radius, size.height * 0.65),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width - radius, size.height * 0.65);
    path.arcToPoint(
      Offset(size.width, size.height * 0.5),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
