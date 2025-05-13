import 'package:flutter/material.dart';
import 'package:icar/ui/core/app_colors.dart';

class RootContainer extends StatelessWidget {
  const RootContainer({
    super.key,
    this.padding = const EdgeInsets.all(16),
    required this.child,
  }) : borderRadius = null;

  const RootContainer.roundedTop({
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
    required this.child,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        child: child,
      ),
    );
  }
}
