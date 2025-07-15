import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/ticket/viewmodels/ticket_review_viewmodel.dart';

class Suggestion extends ConsumerWidget {
  const Suggestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(suggestionInputProvider); // initialize

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
            ref.read(suggestionInputProvider.notifier).setSuggestion(value);
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
