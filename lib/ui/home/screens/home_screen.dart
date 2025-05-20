import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/home/widgets/check_queue/check_queue.dart';
import 'package:icar/ui/home/widgets/my_queue.dart';
import 'package:icar/ui/home/widgets/track_icar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary600,
      appBar: AppBar(title: const Text('Antre iCar ITS')),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CheckQueue(),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                decoration: const BoxDecoration(color: AppColors.white),
                child: const Column(
                  children: [MyQueue(), SizedBox(height: 20), TrackIcar()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
