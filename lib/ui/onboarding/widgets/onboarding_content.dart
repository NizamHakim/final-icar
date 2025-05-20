import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/onboarding/viewmodels/onboarding_viewmodel.dart';

class OnboardingContent extends ConsumerWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(onboardingIndexProvider);
    return <Widget>[
      const _TextContent(
        title: "Antre pakai Aplikasi",
        description:
            "Keliling ITS dengan iCar dan lihat antrean pakai aplikasi",
      ),
      const _TextContent(
        title: "Lacak iCar",
        description: "Lacak posisi iCar dan bersiap untuk perjalanan",
      ),
      const _TextContent(
        title: "Pergi ke Halte",
        description: "Pergi ke halte saat iCar sudah dekat",
      ),
    ][index];
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: AppColors.gray500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
