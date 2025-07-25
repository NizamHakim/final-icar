import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/themes/app_colors.dart';
import 'package:icar/ui/features/ticket/widgets/ticket_card/tc_body.dart';
import 'package:icar/ui/features/ticket/widgets/ticket_card/tc_footer.dart';
import 'package:icar/ui/features/ticket/widgets/ticket_card/tc_header.dart';
import 'package:icar/ui/features/ticket/widgets/ticket_card/ticket_clipper.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Card(
        elevation: 6,
        child: Center(
          child: Column(
            children: [
              TcHeader(ticket: ticket),
              const DottedLine(
                lineLength: double.infinity,
                lineThickness: 3,
                dashLength: 10,
                dashColor: AppColors.gray50,
                dashGapLength: 8,
              ),
              TcBody(ticket: ticket),
              const Divider(color: AppColors.gray50, thickness: 2, height: 0),
              TcFooter(ticket: ticket),
            ],
          ),
        ),
      ),
    );
  }
}
