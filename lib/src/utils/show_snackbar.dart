import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

void showSnackBar(
  BuildContext context,
  String message, {
  Color backgroundColor = AppColors.primary600,
  Color textColor = AppColors.white,
  bool showCloseIcon = true,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: textColor),
      ),
      backgroundColor: backgroundColor.withValues(alpha: 0.9),
      showCloseIcon: showCloseIcon,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 25.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(14),
      ),
    ),
  );
}
