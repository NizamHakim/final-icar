import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class CenteredGrayText extends StatelessWidget {
  const CenteredGrayText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
