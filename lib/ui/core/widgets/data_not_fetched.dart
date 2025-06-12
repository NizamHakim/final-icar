import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class DataNotFetched extends StatelessWidget {
  const DataNotFetched({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
        textAlign: TextAlign.center,
      ),
    );
  }
}
