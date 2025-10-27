import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_2/flutter_unity_widget_2.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';

class AugmentedRealityScreen extends StatefulWidget {
  const AugmentedRealityScreen({super.key});

  @override
  State<AugmentedRealityScreen> createState() => _AugmentedRealityScreenState();
}

class _AugmentedRealityScreenState extends State<AugmentedRealityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("AR Scene"),
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.gray400,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: RootContainer(
        child: UnityWidget(onUnityCreated: onUnityCreated, fullscreen: true),
      ),
    );
  }

  void onUnityCreated(UnityWidgetController controller) {}
}
