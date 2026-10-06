import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/model/weekly_progress.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/index.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/// Haftanın pratik süresi, hedefe göre durumu ve geçen haftaya farkı.
class HomeWeeklyProgressWidget extends StatelessWidget {
  final WeeklyProgress progress;

  const new({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.cardPadding,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(context.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.space3,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: context.space1,
            children: [
              Point(size: 8.w, color: context.colors.primary),
              Text(
                context.l10n.thisWeek.toUpperCase(),
                style: context.bodySmall!.copyWith(
                  color: context.ds.inkSubtle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          buildTimeRow(context),
          LinearIndicator(progress: progress.progress),
          buildWeeklyDiff(context),
        ],
      ),
    );
  }

  Widget buildTimeRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: progress.hours.toString(),
                style: context.readout,
              ),
              TextSpan(
                text: " ${context.l10n.h} ",
                style: context.bodySmall!.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              TextSpan(
                text: progress.remainingMinutes.toString(),
                style: context.readout,
              ),
              TextSpan(
                text: " ${context.l10n.min}",
                style: context.bodySmall!.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Text(
          context.l10n.goalPractiseHour(progress.goalHours),
          style: context.numericS.copyWith(color: context.ds.inkSubtle),
        ),
      ],
    );
  }

  Widget buildWeeklyDiff(BuildContext context) {
    final diff = progress.diffMinutes;
    final sign = diff >= 0 ? "+" : "−";

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.l10n.comparedToLastWeek,
            style: context.bodySmall!.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: " $sign${diff.abs()} ${context.l10n.min}",
            style: context.bodySmall!.copyWith(
              color: diff >= 0 ? context.ds.signalTrue : context.ds.signalOff,
              fontWeight: FontWeight.w600,
            ),
          ),

          TextSpan(
            text:
                " · ${progress.metronomeHours} ${context.l10n.theClockWithMetronome}",
            style: context.bodySmall!.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
