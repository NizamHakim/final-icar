import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/onboarding_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/themes/app_icons.dart';
import 'package:icar/ui/widgets/app_icon.dart';
import 'package:icar/ui/features/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:icar/ui/root/unauthorized.dart';
import 'package:icar/core/permissions/location/location_permission_manager.dart';

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
            await LocationPermissionManager.requestForPermission(context);
            if (!context.mounted) return;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Unauthorized()),
            );
          },
          child: Text(
            OnboardingLocalizations.of(context)!.skip,
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
                    await LocationPermissionManager.requestForPermission(
                      context,
                    );
                    if (!context.mounted) return;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Unauthorized(),
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
