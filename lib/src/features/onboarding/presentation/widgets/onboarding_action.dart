import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/location/presentation/providers/request_for_location_permission.dart';
import 'package:icar/src/features/onboarding/presentation/providers/onboarding_index.dart';
import 'package:icar/src/features/onboarding/presentation/providers/should_show_onboarding.dart';
import 'package:icar/src/l10n/generated/onboarding_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

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
            await requestForLocationPermission();
            ref
                .read(shouldShowOnboardingProvider.notifier)
                .setShouldShowOnboarding(false);
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
                    await requestForLocationPermission();
                    ref
                        .read(shouldShowOnboardingProvider.notifier)
                        .setShouldShowOnboarding(false);
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
