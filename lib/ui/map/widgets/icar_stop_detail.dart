import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/core/providers/user_location.dart';
import 'package:icar/data/models/icar.dart';
import 'package:icar/data/models/icar_stop.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/text_badge.dart';
import 'package:icar/ui/map/viewmodels/map_viewmodel.dart';
import 'package:icar/ui/core/errors/location_permission_denied.dart';
import 'package:icar/ui/core/errors/location_service_disabled.dart';
import 'package:icar/ui/map/widgets/schedule_table/schedule_table.dart';

class IcarStopDetail extends ConsumerWidget {
  const IcarStopDetail({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationProvider);

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
                child: userLocation.when(
                  data: (userPosition) {
                    final icarStopDetail = ref.watch(
                      icarStopDetailProvider(icarStop, userPosition),
                    );
                    final icarList = ref.watch(icarListProvider(icarStop));

                    if (icarStopDetail.isLoading || icarList.isLoading) {
                      return const CircularLoader();
                    } else if (icarStopDetail.hasError) {
                      return DataNotFetched(
                        text: icarStopDetail.error.toString(),
                      );
                    } else if (icarList.hasError) {
                      return DataNotFetched(text: icarList.error.toString());
                    } else {
                      return Column(
                        children: [
                          _IcarStopDetailHeader(
                            icarStop: icarStopDetail.asData!.value,
                          ),
                          const _IcarStopDetailDivider(),
                          _IcarStopDetailContent(
                            icarList: icarList.asData!.value,
                          ),
                        ],
                      );
                    }
                  },
                  error: (error, _) {
                    if (error is LocationServiceDisabledException) {
                      return const LocationServiceDisabled();
                    } else if (error is PermissionDeniedException) {
                      return const LocationPermissionDenied();
                    } else {
                      return DataNotFetched(text: error.toString());
                    }
                  },
                  loading: () => const CircularLoader(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IcarStopDetailHeader extends StatelessWidget {
  const _IcarStopDetailHeader({required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halte ${icarStop.name}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "${icarStop.distance}m",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "•",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const AppIcon(
                      iconSvg: AppIconsSvg.walk,
                      size: 20,
                      color: AppColors.gray400,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${icarStop.duration!.inMinutes} menit",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextBadge(
            text: Text(
              "Berhenti 1 menit",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            foregroundColor: AppColors.primary500,
            backgroundColor: AppColors.primary50,
            icon: const AppIcon(iconSvg: AppIconsSvg.infoCircle, size: 14),
          ),
        ],
      ),
    );
  }
}

class _IcarStopDetailDivider extends StatelessWidget {
  const _IcarStopDetailDivider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DottedLine(
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 6,
          dashColor: AppColors.gray100,
          dashGapLength: 6,
        ),
        Container(
          width: double.infinity,
          height: 34,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: const BoxDecoration(color: AppColors.gray50),
          child: Text(
            "Jadwal Tiba",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.gray700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const DottedLine(
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 6,
          dashColor: AppColors.gray100,
          dashGapLength: 6,
        ),
      ],
    );
  }
}

class _IcarStopDetailContent extends ConsumerWidget {
  const _IcarStopDetailContent({required this.icarList});

  final List<Icar> icarList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(icarSchedulePageControllerProvider);
    final icar = icarList[pageIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          Stack(
            children: [
              if (pageIndex > 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(icarSchedulePageControllerProvider.notifier)
                          .previous();
                    },
                    child: const AppIcon(
                      iconSvg: AppIconsSvg.chevronLeft,
                      color: AppColors.gray600,
                      size: 20,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.center,
                child: TextBadge(
                  text: Text(icar.name),
                  foregroundColor: icar.icarRoute!.color,
                  backgroundColor: AppColors.gray50,
                  icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
                ),
              ),
              if (pageIndex < icarList.length - 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(icarSchedulePageControllerProvider.notifier)
                          .next();
                    },
                    child: const AppIcon(
                      iconSvg: AppIconsSvg.chevronRight,
                      color: AppColors.gray600,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          ScheduleTable(icar: icar),
        ],
      ),
    );
  }
}
