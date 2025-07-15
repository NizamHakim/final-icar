import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.iconSvg,
    this.size = 24,
    this.color = AppColors.gray700,
  });

  final AppIconsSvg iconSvg;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconSvg.path,
      colorMapper: _AppIconMapper(color),
      width: size,
      height: size,
    );
  }
}

class _AppIconMapper extends ColorMapper {
  const _AppIconMapper(this.selectedColor);

  final Color selectedColor;

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (color == const Color.fromARGB(255, 0, 0, 0)) {
      return selectedColor; // replace black to selectedColor
    }
    return color; // default color, no change from the SVG
  }
}
