import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';

class CheckQueueSelect extends ConsumerWidget {
  const CheckQueueSelect({
    super.key,
    required this.onTap,
    required this.hintText,
    required this.iconSvg,
    required this.label,
    required this.value,
  });

  final void Function() onTap;
  final String hintText;
  final AppIconsSvg iconSvg;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray100, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: AppIcon(iconSvg: iconSvg, color: AppColors.primary600),
            ),
            value == null
                ? Text(
                  hintText,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppColors.gray300),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: AppColors.gray300),
                    ),
                    Text(
                      value!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray900,
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
