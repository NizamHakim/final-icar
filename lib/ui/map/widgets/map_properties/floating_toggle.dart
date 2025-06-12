import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/map/viewmodels/map_properties/map_properties_viewmodel.dart';
import 'package:icar/ui/map/widgets/map_properties/route_checkbox.dart';

class FloatingToggle extends ConsumerWidget {
  const FloatingToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeList = ref.watch(routeStateListProvider).value;

    return Card(
      child: Column(
        children: [
          for (var i = 0; i < routeList!.length; i++) ...[
            RouteCheckbox(
              icarRoute: routeList[i].route,
              isChecked: routeList[i].visible,
              onChanged: () {
                ref
                    .read(routeStateListProvider.notifier)
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
