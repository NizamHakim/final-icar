// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

enum TicketStatus {
  IN_QUEUE(
    foregroundColor: AppColors.success500,
    backgroundColor: AppColors.success50,
  ),
  CANCELED(
    foregroundColor: AppColors.error500,
    backgroundColor: AppColors.error50,
  ),
  FINISHED(
    foregroundColor: AppColors.primary500,
    backgroundColor: AppColors.primary50,
  );

  const TicketStatus({
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final Color foregroundColor;
  final Color backgroundColor;
}
