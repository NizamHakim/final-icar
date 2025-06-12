import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/themes/app_icons.dart';
import 'package:icar/ui/core/widgets/app_icon.dart';
import 'package:icar/ui/ticket/viewmodels/ticket_history_viewmodel.dart';

class RatingStar extends ConsumerWidget {
  const RatingStar({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(ratingProvider);

    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              TicketLocalizations.of(context)!.whatDoYouThink,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.gray900,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                for (int index = 1; index <= 5; index++)
                  (index <= rating)
                      ? GestureDetector(
                        onTap: () {
                          ref.read(ratingProvider.notifier).setRating(index);
                        },
                        child: const AppIcon(
                          iconSvg: AppIconsSvg.starFilled,
                          color: AppColors.secondary500,
                          size: 25,
                        ),
                      )
                      : GestureDetector(
                        onTap: () {
                          ref.read(ratingProvider.notifier).setRating(index);
                        },
                        child: const AppIcon(
                          iconSvg: AppIconsSvg.starOutline,
                          color: AppColors.gray100,
                          size: 25,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
