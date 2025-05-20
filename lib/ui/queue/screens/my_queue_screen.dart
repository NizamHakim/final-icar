import 'package:flutter/material.dart';
import 'package:icar/data/models/ticket/ticket.dart';
import 'package:icar/ui/core/themes/app_colors.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/queue/widgets/my_queue/queue_ticket_list.dart';

class MyQueueScreen extends StatelessWidget {
  const MyQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text('Antrian Saya')),
        body: RootContainer.roundedTop(
          child: Column(
            children: [
              TabBar(
                automaticIndicatorColorAdjustment: false,
                tabs: const [
                  Tab(text: 'Dalam antrean'),
                  Tab(text: 'Dibatalkan'),
                  Tab(text: 'Selesai'),
                ],
                unselectedLabelStyle: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray400,
                ),
                labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary500,
                ),
                dividerColor: AppColors.gray100,
                indicatorColor: AppColors.primary500,
              ),
              const SizedBox(height: 14),
              const Expanded(
                child: TabBarView(
                  children: [
                    QueueTicketList(ticketStatus: TicketStatus.IN_QUEUE),
                    QueueTicketList(ticketStatus: TicketStatus.CANCELED),
                    QueueTicketList(ticketStatus: TicketStatus.FINISHED),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
