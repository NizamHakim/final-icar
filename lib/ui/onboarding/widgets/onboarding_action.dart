import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:icar/ui/root/authorized.dart';
import 'package:icar/util/permissions/location_manager.dart';

class OnboardingAction extends ConsumerWidget {
  const OnboardingAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(onboardingIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () async {
            await LocationManager.requestPermission(context);
            if (!context.mounted) return;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Authorized()),
            );
          },
          child: Text(
            "Skip",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.gray600,
            ),
          ),
        ),
        TextButton(
          onPressed:
              index != 2
                  ? () {
                    ref.read(onboardingIndexProvider.notifier).set(index + 1);
                  }
                  : () async {
                    await LocationManager.requestPermission(context);
                    if (!context.mounted) return;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Authorized(),
                      ),
                    );
                  },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: AppColors.primary500,
            shape: const CircleBorder(),
          ),
          child: const AppIcon(
            iconSvg: AppIconsSvg.arrowRight,
            size: 20,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
