import 'package:flutter/material.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/home/widgets/track_icar/map_preview.dart';

class TrackIcar extends StatelessWidget {
  const TrackIcar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            'Lacak iCar',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.gray900,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const MapPreview(),
      ],
    );
  }
}
