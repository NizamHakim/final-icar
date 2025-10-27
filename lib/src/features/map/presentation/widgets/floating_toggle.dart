import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/map/presentation/providers/routes_visibility.dart';
import 'package:icar/src/features/map/presentation/widgets/floating_toggle_route_checkbox.dart';

class FloatingToggle extends ConsumerWidget {
  const FloatingToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeList = ref.watch(routesVisibilityProvider).requireValue;

    return Card(
      child: Column(
        children: [
          for (var i = 0; i < routeList.length; i++) ...[
            FloatingToggleRouteCheckbox(
              icarRoute: routeList[i].route,
              isChecked: routeList[i].visible,
              onChanged: () {
                ref
                    .read(routesVisibilityProvider.notifier)
                    .toggleRouteVisibility(routeList[i]);
              },
            ),
            if (i != routeList.length - 1)
              const Divider(height: 0, color: AppColors.gray100),
          ],
        ],
      ),
    );
  }
}
