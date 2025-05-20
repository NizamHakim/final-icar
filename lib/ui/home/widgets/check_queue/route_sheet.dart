import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/models/icar_route.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/home/viewmodels/home_viewmodel.dart';
import 'package:icar/ui/home/widgets/check_queue/route_radio_tile.dart';

class RouteSheet extends ConsumerStatefulWidget {
  const RouteSheet({super.key});

  @override
  ConsumerState<RouteSheet> createState() => _RouteSheetState();
}

class _RouteSheetState extends ConsumerState<RouteSheet> {
  late IcarRoute? _selectedRoute;

  @override
  void initState() {
    super.initState();
    _selectedRoute = ref.read(selectedRouteProvider);
  }

  @override
  Widget build(BuildContext context) {
    final routeList = ref.watch(routeListProvider);

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
      child: routeList.when(
        data: (routeList) {
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
                  "Pilih Rute",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray700,
                  ),
                ),
              ),
              for (final route in routeList)
                RouteRadioTile(
                  value: route,
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
                        "Batal",
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
                          _selectedRoute == null
                              ? null
                              : () {
                                ref
                                    .read(selectedRouteProvider.notifier)
                                    .setSelectedRoute(_selectedRoute!);
                                Navigator.of(context).pop();
                              },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.primary500,
                        disabledBackgroundColor: AppColors.primary500
                            .withValues(alpha: 0.5),
                      ),
                      child: Text(
                        "Simpan",
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
        error: (error, stackTrace) {
          return const Center(child: Text("Error loading routes"));
        },
        loading: () {
          return const Center(child: CircularLoader(size: 16));
        },
      ),
    );
  }
}
