import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_card/ticket_card_body.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_card/ticket_card_footer.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_card/ticket_card_header.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TicketClipper(),
      child: Card(
        elevation: 6,
        child: Center(
          child: Column(
            children: [
              TicketCardHeader(ticket: ticket),
              const DottedLine(
                lineLength: double.infinity,
                lineThickness: 3,
                dashLength: 10,
                dashColor: AppColors.gray50,
                dashGapLength: 8,
              ),
              TicketCardBody(ticket: ticket),
              const Divider(color: AppColors.gray50, thickness: 2, height: 0),
              TicketCardFooter(ticket: ticket),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;
    double heightStart = 135;
    double heightEnd = 165;

    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, heightStart);
    path.arcToPoint(
      Offset(size.width, heightEnd),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, heightEnd);
    path.arcToPoint(
      Offset(0, heightStart),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
