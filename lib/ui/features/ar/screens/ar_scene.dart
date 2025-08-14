import 'package:flutter/material.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/root_container.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ArScene extends StatefulWidget {
  const ArScene({super.key});

  @override
  State<ArScene> createState() => _ArSceneState();
}

class _ArSceneState extends State<ArScene> {
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
