import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/home/presentation/providers/selected_icar_stop.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/l10n/generated/shared_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';

class SelectIcarStopTile extends ConsumerWidget {
  const SelectIcarStopTile({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            ref
                .read(selectedIcarStopProvider.notifier)
                .setSelectedStop(icarStop);
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SharedLocalizations.of(context)!.stopWithName(icarStop.name),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "${icarStop.distance}m",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "•",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const AppIcon(
                      iconSvg: AppIconsSvg.walk,
                      size: 20,
                      color: AppColors.gray400,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      SharedLocalizations.of(
                        context,
                      )!.minutes(icarStop.duration!.inMinutes),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.gray50, thickness: 1, height: 0),
      ],
    );
  }
}
