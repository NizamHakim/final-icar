import 'package:flutter/material.dart';
import 'package:icar/ui/features/ar/screens/ar_scene.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';

class ScanArButton extends StatelessWidget {
  const ScanArButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const ArScene()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: const AppIcon(
        iconSvg: AppIconsSvg.scanner,
        color: AppColors.primary600,
        size: 20,
      ),
    );
  }
}
