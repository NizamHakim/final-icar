import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/home/widgets/check_queue/check_queue.dart';
import 'package:icar/ui/features/home/widgets/closest_ticket/closest_ticket.dart';
import 'package:icar/ui/features/home/widgets/track_icar/track_icar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary600,
      appBar: AppBar(title: Text(CoreLocalizations.of(context)!.appName)),
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
