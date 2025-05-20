import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key, this.size, this.color});

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 16,
        height: size ?? 16,
        child: CircularProgressIndicator(
          color: color ?? AppColors.gray600,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
