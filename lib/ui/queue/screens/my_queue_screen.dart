import 'package:flutter/material.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/queue/widgets/canceled_tickets.dart';
import 'package:icar/ui/queue/widgets/expired_tickets.dart';
import 'package:icar/ui/queue/widgets/in_queue_tickets.dart';

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
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                dividerColor: Theme.of(context).colorScheme.outline,
                indicatorColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 14),
              const Expanded(
                child: TabBarView(
                  children: [
                    InQueueTickets(),
                    CanceledTickets(),
                    ExpiredTickets(),
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
