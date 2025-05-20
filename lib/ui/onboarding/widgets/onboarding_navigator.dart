import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/onboarding/viewmodels/onboarding_viewmodel.dart';

class OnboardingNavigator extends ConsumerWidget {
  const OnboardingNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int activeIndex = ref.watch(onboardingIndexProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: List.generate(3, (index) {
        return _NavigationTile(
          isActive: index == activeIndex,
          onTap: () {
            ref.read(onboardingIndexProvider.notifier).set(index);
          },
        );
      }),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({required this.isActive, required this.onTap});

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 48,
        height: 8,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary500 : AppColors.primary50,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
