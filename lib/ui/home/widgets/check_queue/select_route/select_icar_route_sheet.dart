import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:flutter_gen/gen_l10n/home_localizations.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/home/viewmodels/icar_route/icar_route_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/select_route/icar_route_radio.dart';

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
    _selectedRoute = ref.read(selectedRouteProvider);
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
          return Column(
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
                  HomeLocalizations.of(context)!.cqSelectRouteHint,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray700,
                  ),
                ),
              ),
              for (final icarRoutesOption in icarRoutesOptionsData)
                IcarRouteRadio(
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.gray100,
                          width: 1,
                        ),
                        foregroundColor: AppColors.gray700,
                        backgroundColor: AppColors.white,
                      ),
                      child: Text(
                        CoreLocalizations.of(context)!.cancel,
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
                                    .read(selectedRouteProvider.notifier)
                                    .setSelectedRoute(_selectedRoute!);
                                Navigator.of(context).pop();
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.primary500,
                        disabledBackgroundColor: AppColors.primary500
                            .withValues(alpha: 0.5),
                      ),
                      child: Text(
                        CoreLocalizations.of(context)!.save,
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
          );
        },
        error: (error, _) {
          return DataNotFetched(
            text: CoreLocalizations.of(context)!.internalServerError,
          );
        },
        loading: () {
          return const CircularLoader(size: 16);
        },
      ),
    );
  }
}
