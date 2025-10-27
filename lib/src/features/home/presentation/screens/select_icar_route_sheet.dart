import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/home/presentation/providers/icar_routes_options.dart';
import 'package:icar/src/features/home/presentation/providers/selected_icar_route.dart';
import 'package:icar/src/l10n/generated/home_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/home/presentation/widgets/select_icar_route_radio.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_route.dart';
import 'package:icar/src/utils/handle_error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectIcarRouteSheet extends ConsumerStatefulWidget {
  const SelectIcarRouteSheet({super.key});

  @override
  ConsumerState<SelectIcarRouteSheet> createState() =>
      _SelectIcarRouteSheetState();
}

class _SelectIcarRouteSheetState extends ConsumerState<SelectIcarRouteSheet> {
  late IcarRoute? _selectedRoute;

  @override
  void initState() {
    super.initState();
    _selectedRoute = ref.read(selectedIcarRouteProvider);
  }

  @override
  Widget build(BuildContext context) {
    final icarRoutesOptions = ref.watch(icarRoutesOptionsProvider);

    return Container(
      width: double.infinity,
      height: 344,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: icarRoutesOptions.when(
        data: (icarRoutesOptionsData) {
          return _content(
            context,
            icarRoutesOptionsData: icarRoutesOptionsData,
            isLoading: false,
          );
        },
        error: (error, stackTrace) {
          return handleError(context, error, stackTrace);
        },
        loading: () {
          return _content(
            context,
            icarRoutesOptionsData: fakeIcarRoutes,
            isLoading: true,
          );
        },
      ),
    );
  }

  Widget _content(
    BuildContext context, {
    required List<IcarRoute> icarRoutesOptionsData,
    required bool isLoading,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: AppColors.gray100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              HomeLocalizations.of(context)!.checkQueueHint('route'),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.gray700,
              ),
            ),
          ),
          for (final icarRoutesOption in icarRoutesOptionsData)
            SelectIcarRouteRadio(
              value: icarRoutesOption,
              onChanged: (value) {
                setState(() {
                  _selectedRoute = value;
                });
              },
              groupValue: _selectedRoute,
            ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pop(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.gray100, width: 1),
                    foregroundColor: AppColors.gray700,
                    backgroundColor: AppColors.white,
                  ),
                  child: Text(
                    SharedLocalizations.of(context)!.cancel,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      _selectedRoute != null
                          ? () {
                            ref
                                .read(selectedIcarRouteProvider.notifier)
                                .setSelectedRoute(_selectedRoute!);
                            context.pop();
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primary500,
                    disabledBackgroundColor: AppColors.primary500.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  child: Text(
                    SharedLocalizations.of(context)!.save,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
