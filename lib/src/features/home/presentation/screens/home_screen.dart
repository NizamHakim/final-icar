import 'package:flutter/material.dart';
import 'package:icar/src/features/home/presentation/widgets/check_queue.dart';
import 'package:icar/src/features/home/presentation/widgets/track_icar.dart';
import 'package:icar/src/features/ticket/presentation/widgets/closest_ticket.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary600,
      appBar: AppBar(title: Text(SharedLocalizations.of(context)!.appName)),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CheckQueue(),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                decoration: const BoxDecoration(color: AppColors.white),
                child: const Column(
                  children: [
                    SizedBox(height: 20),
                    ClosestTicket(),
                    SizedBox(height: 20),
                    TrackIcar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
