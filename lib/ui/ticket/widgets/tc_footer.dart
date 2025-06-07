import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ticket_localizations.dart';
import 'package:icar/ui/core/themes/app_colors.dart';

class TcFooter extends StatelessWidget {
  const TcFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.error300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            TicketLocalizations.of(context)!.cancelTicketButtonLabel,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.error500,
            ),
          ),
        ),
      ),
    );
  }
}
