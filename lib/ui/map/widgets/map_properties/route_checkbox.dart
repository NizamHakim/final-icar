import 'package:flutter/material.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class RouteCheckbox extends StatelessWidget {
  const RouteCheckbox({
    super.key,
    required this.icarRoute,
    required this.isChecked,
    required this.onChanged,
  });

  final IcarRoute icarRoute;
  final bool isChecked;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 4,
                  decoration: BoxDecoration(
                    color: icarRoute.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  icarRoute.name,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: AppColors.gray700),
                ),
              ],
            ),
            Checkbox(
              value: isChecked,
              onChanged: (_) {
                onChanged();
              },
              activeColor: AppColors.primary50,
              checkColor: AppColors.primary500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: const WidgetStateBorderSide.fromMap(<
                WidgetStatesConstraint,
                BorderSide
              >{
                WidgetState.selected: BorderSide(
                  color: AppColors.primary500,
                  width: 1,
                ),
                WidgetState.any: BorderSide(color: AppColors.gray200, width: 1),
              }),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}
