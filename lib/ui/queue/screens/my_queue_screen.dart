import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/queue_localizations.dart';
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
        backgroundColor: AppColors.primary600,
        appBar: AppBar(
          title: Text(QueueLocalizations.of(context)!.myQueueScreenTitle),
        ),
        body: RootContainer.roundedTop(
          child: Column(
            children: [
              TabBar(
                automaticIndicatorColorAdjustment: false,
                tabs: [
                  for (final status in TicketStatus.values)
                    Tab(
                      text: QueueLocalizations.of(
                        context,
                      )!.ticketStatus(status.name),
                    ),
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
              Expanded(
                child: TabBarView(
                  children: [
                    for (final status in TicketStatus.values)
                      QueueTicketList(ticketStatus: status),
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
