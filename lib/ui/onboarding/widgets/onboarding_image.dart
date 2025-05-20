import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icar/ui/onboarding/viewmodels/onboarding_viewmodel.dart';

class OnboardingImage extends ConsumerWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(onboardingIndexProvider);
    return <Widget>[
      SvgPicture.asset('assets/images/onboarding_1.svg', fit: BoxFit.scaleDown),
      SvgPicture.asset('assets/images/onboarding_2.svg', fit: BoxFit.scaleDown),
      SvgPicture.asset('assets/images/onboarding_3.svg', fit: BoxFit.scaleDown),
    ][index];
  }
}
