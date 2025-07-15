import 'package:flutter/material.dart';
import 'package:icar/ui/features/ticket/screens/ticket_review_sheet.dart';

void showReviewSheet(BuildContext context, int ticketId) {
  showModalBottomSheet(
    context: context,
    builder: (context) => TicketReviewSheet(ticketId: ticketId),
    isScrollControlled: true,
    useSafeArea: true,
  );
}
