import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/l10n/generated/schedule_localizations.dart';
import 'package:icar/src/shared/domain/entities/icar.dart';
import 'package:icar/src/shared/presentation/widgets/app_icon.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/config/themes/app_icons.dart';
import 'package:icar/src/shared/presentation/widgets/text_badge.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_table/schedule_table.dart';

class ScheduleDialogContent extends ConsumerStatefulWidget {
  const ScheduleDialogContent({super.key, required this.icarList});

  final List<Icar> icarList;

  @override
  ConsumerState<ScheduleDialogContent> createState() =>
      _ScheduleDialogContentState();
}

class _ScheduleDialogContentState extends ConsumerState<ScheduleDialogContent> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (widget.icarList.isEmpty) {
      content = CenteredGrayText(
        text: ScheduleLocalizations.of(context)!.noScheduleAvailable,
      );
    } else {
      final icar = widget.icarList[pageIndex];
      content = Column(
        children: [
          Stack(
            children: [
              if (pageIndex > 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex--;
                      });
                    },
                    child: const AppIcon(
                      iconSvg: AppIconsSvg.chevronLeft,
                      color: AppColors.gray600,
                      size: 20,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.center,
                child: TextBadge(
                  text: Text(icar.name),
                  foregroundColor: icar.icarRoute!.color,
                  backgroundColor: icar.icarRoute!.secondaryColor,
                  icon: const AppIcon(iconSvg: AppIconsSvg.carRight, size: 14),
                ),
              ),
              if (pageIndex < widget.icarList.length - 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex++;
                      });
                    },
                    child: const AppIcon(
                      iconSvg: AppIconsSvg.chevronRight,
                      color: AppColors.gray600,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          ScheduleTable(icar: icar),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: content,
    );
  }
}
