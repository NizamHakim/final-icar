import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/features/augmented_reality/screens/augmented_reality_screen.dart';

class ScanArButton extends StatelessWidget {
  const ScanArButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AugmentedRealityScreen(),
          ),
        );
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
