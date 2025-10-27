import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/onboarding/presentation/providers/onboarding_index.dart';
import 'package:icar/src/l10n/generated/onboarding_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class OnboardingContent extends ConsumerWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(onboardingIndexProvider);
    return <Widget>[
      _TextContent(
        title: OnboardingLocalizations.of(context)!.onboardingTitle('1'),
        description: OnboardingLocalizations.of(
          context,
        )!.onboardingDescription('1'),
      ),
      _TextContent(
        title: OnboardingLocalizations.of(context)!.onboardingTitle('2'),
        description: OnboardingLocalizations.of(
          context,
        )!.onboardingDescription('2'),
      ),
      _TextContent(
        title: OnboardingLocalizations.of(context)!.onboardingTitle('3'),
        description: OnboardingLocalizations.of(
          context,
        )!.onboardingDescription('3'),
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
