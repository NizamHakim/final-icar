import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/onboarding_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/onboarding/viewmodels/onboarding_viewmodel.dart';

class OnboardingContent extends ConsumerWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(onboardingIndexProvider);
    return <Widget>[
      _TextContent(
        title: OnboardingLocalizations.of(context)!.onboardingTitle1,
        description:
            OnboardingLocalizations.of(context)!.onboardingDescription1,
      ),
      _TextContent(
        title: OnboardingLocalizations.of(context)!.onboardingTitle2,
        description:
            OnboardingLocalizations.of(context)!.onboardingDescription2,
      ),
      _TextContent(
        title: OnboardingLocalizations.of(context)!.onboardingTitle3,
        description:
            OnboardingLocalizations.of(context)!.onboardingDescription3,
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
