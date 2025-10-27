import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/home/presentation/providers/icar_stops_options.dart';
import 'package:icar/src/features/home/presentation/providers/search_stop.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/features/home/presentation/widgets/select_icar_stop_options.dart';
import 'package:icar/src/features/home/presentation/widgets/select_icar_stop_history.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectIcarStopScreen extends ConsumerWidget {
  const SelectIcarStopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchStopValue = ref.watch(searchStopProvider);
    final icarStopOptionsFromHistory = ref.watch(
      icarStopsOptionsFromHistoryProvider,
    );
    final filteredIcarStopOptions = ref.watch(icarStopsOptionsProvider);

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
              ref.read(searchStopProvider.notifier).setSearchValue(value);
            },
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 16, end: 12),
                child: AppIcon(iconSvg: AppIconsSvg.search, size: 22),
              ),
              contentPadding: EdgeInsets.zero,
              hintText: HomeLocalizations.of(context)!.selectStopFindStopHint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
            ),
          ),
        ),
      ),
      body: RootContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icarStopOptionsFromHistory.when(
                data: (historyOptions) {
                  if (searchStopValue.isEmpty && historyOptions.isNotEmpty) {
                    return SelectIcarStopHistory(
                      icarStopOptionsFromHistory: historyOptions,
                    );
                  }
                  return const SizedBox.shrink();
                },
                error: (error, stackTrace) {
                  return handleError(context, error, stackTrace);
                },
                loading: () {
                  return Skeletonizer(
                    enabled: true,
                    child: SelectIcarStopHistory(
                      icarStopOptionsFromHistory: fakeIcarStops,
                    ),
                  );
                },
              ),
              filteredIcarStopOptions.when(
                data: (filteredOptions) {
                  if (filteredOptions.isEmpty) {
                    return CenteredGrayText(
                      text:
                          HomeLocalizations.of(
                            context,
                          )!.selectStopNoStopMatched,
                    );
                  }
                  return SelectIcarStopOptions(
                    icarStopOptions: filteredOptions,
                  );
                },
                error: (error, stackTrace) {
                  return handleError(context, error, stackTrace);
                },
                loading: () {
                  return Skeletonizer(
                    child: SelectIcarStopOptions(
                      icarStopOptions: fakeIcarStops,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
