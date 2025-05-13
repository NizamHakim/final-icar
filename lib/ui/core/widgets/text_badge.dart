import 'package:flutter/material.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';

class TextBadge extends StatelessWidget {
  const TextBadge({
    super.key,
    required this.text,
    this.icon,
    required this.foregroundColor,
    required this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
  });

  final Text text;
  final AppIcon? icon;
  final Color foregroundColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            AppIcon(
              iconSvg: icon!.iconSvg,
              size: icon!.size,
              color: foregroundColor,
            ),
          if (icon != null) const SizedBox(width: 4),
          Text(
            text.data!,
            style:
                text.style?.copyWith(color: foregroundColor) ??
                Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: foregroundColor),
          ),
        ],
      ),
    );
  }
}
