import 'package:flutter/material.dart';
import 'package:icar/ui/map/widgets/map_preview.dart';

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
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const MapPreview(),
      ],
    );
  }
}
