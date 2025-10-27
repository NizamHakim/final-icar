import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/features/ticket/presentation/providers/suggestion.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';

class ReviewSuggestion extends ConsumerWidget {
  const ReviewSuggestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(suggestionProvider); // initialize

    return Column(
      children: [
        Text(
          TicketLocalizations.of(context)!.anyOtherSuggestion,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.gray900,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          minLines: 3,
          maxLines: 5,
          onChanged: (value) {
            ref.read(suggestionProvider.notifier).setSuggestion(value);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            hintText: TicketLocalizations.of(context)!.enterSuggestion,
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.gray300),
          ),
        ),
      ],
    );
  }
}
