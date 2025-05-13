import 'package:flutter/material.dart';
import 'package:icar/ui/core/app_colors.dart';
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
      appBar: AppBar(
        title: const Text('Antre iCar ITS'),
        scrolledUnderElevation: 0,
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(color: AppColors.white),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                CheckQueue(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    children: [MyQueue(), SizedBox(height: 20), TrackIcar()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
