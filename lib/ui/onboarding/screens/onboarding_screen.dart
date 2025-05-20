import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/onboarding/widgets/onboarding_action.dart';
import 'package:icar/ui/onboarding/widgets/onboarding_content.dart';
import 'package:icar/ui/onboarding/widgets/onboarding_image.dart';
import 'package:icar/ui/onboarding/widgets/onboarding_navigator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreenState();
  }
}

class _OnBoardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: RootContainer(
          padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    OnboardingImage(),
                    SizedBox(height: 24),
                    OnboardingNavigator(),
                    SizedBox(height: 32),
                    OnboardingContent(),
                  ],
                ),
              ),
              OnboardingAction(),
            ],
          ),
        ),
      ),
    );
  }
}
