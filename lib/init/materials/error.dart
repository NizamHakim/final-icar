import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/init/provider/init_app.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/widgets/data_not_fetched.dart';
import 'package:icar/ui/themes/app_theme.dart';

class InitializationError extends ConsumerWidget {
  const InitializationError({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'iCar ITS',
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataNotFetched(text: errorMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                ref.invalidate(initAppProvider);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.primary600,
                disabledBackgroundColor: AppColors.primary600.withValues(
                  alpha: 0.5,
                ),
              ),
              child: Text(
                "Retry",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
