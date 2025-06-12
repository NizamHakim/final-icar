import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/util/permissions/location/widgets/location_permission_denied.dart';
import 'package:icar/util/permissions/location/widgets/location_service_disabled.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/home/viewmodels/icar_stop/icar_stop_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/select_icar_stop/all_options.dart';
import 'package:icar/ui/home/widgets/check_queue/select_icar_stop/latest_search.dart';

class SelectIcarStopScreen extends ConsumerWidget {
  const SelectIcarStopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchStopValue = ref.watch(searchStopValueProvider);
    final icarStopOptionsFromHistory = ref.watch(
      icarStopOptionsFromHistoryProvider,
    );
    final filteredIcarStopOptions = ref.watch(filteredIcarStopOptionsProvider);

    Widget content;

    if (filteredIcarStopOptions.isLoading ||
        icarStopOptionsFromHistory.isLoading) {
      content = const CircularLoader();
    } else if (filteredIcarStopOptions.hasError) {
      content = _showErrorWidget(filteredIcarStopOptions.error!, context);
    } else if (icarStopOptionsFromHistory.hasError) {
      content = _showErrorWidget(icarStopOptionsFromHistory.error!, context);
    } else {
      final filteredOptions = filteredIcarStopOptions.asData!.value;

      if (filteredOptions.isEmpty) {
        content = DataNotFetched(
          text: HomeLocalizations.of(context)!.cqNoStopMatched,
        );
      } else {
        content = SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (searchStopValue.isEmpty &&
                  icarStopOptionsFromHistory.asData!.value.isNotEmpty)
                LatestSearch(
                  icarStopOptionsFromHistory:
                      icarStopOptionsFromHistory.asData!.value,
                ),
              AllOptions(icarStopOptions: filteredOptions),
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
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
              ref.read(searchStopValueProvider.notifier).setSearchValue(value);
            },
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 16, end: 12),
                child: AppIcon(iconSvg: AppIconsSvg.search, size: 22),
              ),
              contentPadding: EdgeInsets.zero,
              hintText: HomeLocalizations.of(context)!.cqFindStopHint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
            ),
          ),
        ),
      ),
      body: RootContainer(child: content),
    );
  }

  Widget _showErrorWidget(Object error, BuildContext context) {
    if (error is LocationServiceDisabledException) {
      return const LocationServiceDisabled();
    } else if (error is PermissionDeniedException) {
      return const LocationPermissionDenied();
    } else {
      return DataNotFetched(
        text: CoreLocalizations.of(context)!.internalServerError,
      );
    }
  }
}
