import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/providers/bottom_nav_index.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/home/viewmodels/home_viewmodel.dart';
import 'package:icar/ui/queue/widgets/queue_card.dart';

class MyQueue extends ConsumerWidget {
  const MyQueue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Antrean Saya',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(bottomNavIndexProvider.notifier).set(1);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lihat semua',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray600,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const AppIcon(
                    iconSvg: AppIconsSvg.chevronRight,
                    size: 20,
                    color: AppColors.gray600,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ref
            .watch(closestTicketProvider)
            .when(
              data: (ticket) {
                if (ticket == null) {
                  return DottedBorder(
                    dashPattern: const [10, 6],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    color: AppColors.gray200,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: AppColors.white,
                      child: Center(
                        child: Text(
                          'Tidak ada antrean',
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: AppColors.gray300),
                        ),
                      ),
                    ),
                  );
                }
                return QueueCard(ticket: ticket);
              },
              error: (error, stackTrace) {
                return DottedBorder(
                  dashPattern: const [10, 6],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: AppColors.gray200,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: AppColors.white,
                    child: Center(
                      child: Text(
                        error.toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.gray300,
                        ),
                      ),
                    ),
                  ),
                );
              },
              loading: () {
                return const SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(child: CircularLoader(size: 16)),
                );
              },
            ),
      ],
    );
  }
}
