import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_theme.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';

class InitializationLoading extends StatelessWidget {
  const InitializationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iCar ITS',
      theme: AppTheme.lightTheme,
      home: const Scaffold(body: CircularLoader()),
    );
  }
}
