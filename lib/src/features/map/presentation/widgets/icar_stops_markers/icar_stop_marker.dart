import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/map/presentation/providers/is_showing_details.dart';
import 'package:icar/src/shared/domain/entities/icar_stop.dart';

class IcarStopMarker extends ConsumerWidget {
  const IcarStopMarker({super.key, required this.icarStop});

  final IcarStop icarStop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowingDetailNotifier = ref.read(isShowingDetailProvider.notifier);

    return InkWell(
      onTap: () async {
        isShowingDetailNotifier.setValue(true);

        await context.push("/home/map/${icarStop.id}");

        isShowingDetailNotifier.setValue(false);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 28,
            padding: const EdgeInsets.only(top: 2, left: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              color: AppColors.white,
            ),
            child: Text(
              "${icarStop.id}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(width: 6, height: 10, color: AppColors.primary500),
        ],
      ),
    );
  }
}
