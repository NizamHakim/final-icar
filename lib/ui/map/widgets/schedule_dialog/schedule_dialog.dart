import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/data/core/providers/user_location.dart';
import 'package:icar/data/models/icar_stop/icar_stop.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/map/viewmodels/map_viewmodel.dart';
import 'package:icar/ui/core/errors/location_permission_denied.dart';
import 'package:icar/ui/core/errors/location_service_disabled.dart';
import 'package:icar/ui/map/widgets/schedule_dialog/sd_content.dart';
import 'package:icar/ui/map/widgets/schedule_dialog/sd_divider.dart';
import 'package:icar/ui/map/widgets/schedule_dialog/sd_header.dart';

class ScheduleDialog extends ConsumerWidget {
  const ScheduleDialog({super.key, required this.icarStop});

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
                  data: (userLocationData) {
                    final icarStopDetail = ref.watch(
                      icarStopDetailProvider(icarStop, userLocationData),
                    );
                    final icarList = ref.watch(
                      icarWithSchedulesListProvider(icarStop),
                    );

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
                          SdHeader(icarStop: icarStopDetail.asData!.value),
                          const SdDivider(),
                          SdContent(icarList: icarList.asData!.value),
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
