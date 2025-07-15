import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/map_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/home/widgets/track_icar/map_preview.dart';

class TrackIcar extends StatelessWidget {
  const TrackIcar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            MapLocalizations.of(context)!.mapScreenTitle,
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
