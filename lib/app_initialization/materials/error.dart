import 'package:flutter/material.dart';
import 'package:icar/ui/core/widgets/data_not_fetched.dart';
import 'package:icar/ui/core/themes/app_theme.dart';

class InitializationError extends StatelessWidget {
  const InitializationError({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iCar ITS',
      theme: AppTheme.lightTheme,
      home: Scaffold(body: DataNotFetched(text: errorMessage)),
    );
  }
}
