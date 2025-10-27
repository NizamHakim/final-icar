import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/features/ticket/presentation/providers/tickets_by_status.dart';
import 'package:icar/src/features/ticket/presentation/widgets/ticket_queue_card.dart';
import 'package:icar/src/l10n/generated/ticket_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket.dart';
import 'package:icar/src/features/ticket/domain/entities/ticket_status.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/shared/presentation/widgets/root_container.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:icar/src/utils/handle_error.dart';

class TicketListScreen extends StatelessWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.primary600,
        appBar: AppBar(
          title: Text(TicketLocalizations.of(context)!.myQueueScreenTitle),
        ),
        body: RootContainer.roundedTop(
          child: Column(
            children: [
              TabBar(
                automaticIndicatorColorAdjustment: false,
                tabs: [
                  for (final status in TicketStatus.values)
                    Tab(
                      text: TicketLocalizations.of(
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
                      _TicketList(ticketStatus: status),
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

class _TicketList extends ConsumerWidget {
  const _TicketList({required this.ticketStatus});

  final TicketStatus ticketStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketsByStatusProvider(ticketStatus));
    return tickets.when(
      data: (ticketsData) {
        return _content(
          context,
          ticketsData: ticketsData,
          isLoading: false,
          onRefresh: () {
            return ref.refresh(ticketsByStatusProvider(ticketStatus).future);
          },
        );
      },
      error: (error, stackTrace) {
        return handleError(context, error, stackTrace);
      },
      loading: () {
        return _content(
          context,
          ticketsData: fakeTicketsList,
          isLoading: true,
          onRefresh: () {
            return ref.refresh(ticketsByStatusProvider(ticketStatus).future);
          },
        );
      },
    );
  }

  Widget _content(
    BuildContext context, {
    required List<Ticket> ticketsData,
    required bool isLoading,
    required RefreshCallback onRefresh,
  }) {
    if (ticketsData.isEmpty) {
      return CenteredGrayText(
        text: TicketLocalizations.of(
          context,
        )!.noTicketsByStatus(ticketStatus.name),
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      ignoreContainers: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: CustomScrollView(
            controller: null,
            slivers: [
              SliverList.separated(
                itemCount: ticketsData.length,
                itemBuilder: (context, index) {
                  final ticket = ticketsData[index];
                  return TicketQueueCard(
                    ticket: ticket,
                    onTap: () => context.go("/tickets/${ticket.id}"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
