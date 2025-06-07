import 'package:flutter/material.dart';
import 'package:icar/data/models/icar_route/icar_route.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class IcarRouteRadio extends StatelessWidget {
  const IcarRouteRadio({
    super.key,
    required this.value,
    this.groupValue,
    required this.onChanged,
  });

  final IcarRoute value;
  final IcarRoute? groupValue;
  final ValueChanged<IcarRoute?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 4, top: 6, bottom: 6),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: groupValue == value ? AppColors.primary50 : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                groupValue == value ? AppColors.primary500 : AppColors.gray50,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value.name,
              style:
                  groupValue == value
                      ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primary500,
                        fontWeight: FontWeight.w600,
                      )
                      : Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray700,
                      ),
            ),
            Radio<IcarRoute>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
