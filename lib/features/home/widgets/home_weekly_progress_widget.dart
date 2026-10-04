import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/index.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class HomeWeeklyProgressWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface200,
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
              Point(size: 8.w, color: AppColors.darkAccent),
              Text(
                context.l10n.thisWeek.toUpperCase(),
                style: context.bodySmall!.copyWith(
                  color: AppColors.darkInkSubtle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          buildTimeRow(context),
          LinearIndicator(progress: 10),
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
              TextSpan(text: "4", style: context.readout),
              TextSpan(
                text: " ${context.l10n.h} ",
                style: context.bodySmall!.copyWith(
                  color: AppColors.darkInkMuted,
                ),
              ),
              TextSpan(text: "12", style: context.readout),
              TextSpan(
                text: " ${context.l10n.min}",
                style: context.bodySmall!.copyWith(
                  color: AppColors.darkInkMuted,
                ),
              ),
            ],
          ),
        ),
        Text(
          context.l10n.goalPractiseHour(5),
          style: context.numericS.copyWith(color: AppColors.darkInkSubtle),
        ),
      ],
    );
  }

  Widget buildWeeklyDiff(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.l10n.comparedToLastWeek,
            style: context.bodySmall!.copyWith(color: AppColors.darkInkMuted),
          ),
          TextSpan(
            text: " +48 ${context.l10n.min}",
            style: context.bodySmall!.copyWith(
              color: AppColors.darkSignalTrue,
              fontWeight: FontWeight.w600,
            ),
          ),

          TextSpan(
            text: " · 2.5 ${context.l10n.theClockWithMetronome}",
            style: context.bodySmall!.copyWith(color: AppColors.darkInkMuted),
          ),
        ],
      ),
    );
  }
}
