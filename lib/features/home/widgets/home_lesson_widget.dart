import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/index.dart';

import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

class HomeLessonWidget extends StatelessWidget {
  final String pieceName;
  final int? minBar;
  final int? maxBar;
  final int? bpm;
  final int? lastWorkingBPM;
  final DateTime? delivery;

  const new({
    super.key,
    required this.pieceName,
    this.minBar,
    this.maxBar,
    this.bpm,
    this.lastWorkingBPM,
    this.delivery,
  });

  String details(BuildContext context) {
    String text = "";

    if (minBar != null && maxBar != null) {
      text += "${context.l10n.bars} $minBar-$maxBar";
    }

    if (bpm != null) {
      text += " · ${context.l10n.targetBPM(bpm!)} ";
    }

    return text;
  }

  String parseDeliveryDate() {
    if (delivery == null) return "";

    final moment = Moment(delivery!);
    final isSameWeek = moment.isSameLocalWeekAs(DateTime.now());

    return moment.format(isSameWeek ? "dddd" : "dddd, DD MMMM", true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: context.space2,
      children: [buildTitle(context), buildHomeworkCard(context)],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(context.l10n.homework, style: context.titleLarge),
        Text(
          context.l10n.all,
          style: context.bodySmall!.copyWith(color: AppColors.darkAccentText),
        ),
      ],
    );
  }

  Widget buildHomeworkCard(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface200,
        borderRadius: BorderRadius.circular(context.radiusMd),
      ),
      child: Column(
        spacing: context.space3,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pieceName, style: context.titleMedium),
                  Text(
                    details(context),
                    style: context.numericS.copyWith(
                      color: AppColors.darkInkSubtle,
                    ),
                  ),
                ],
              ),
              buildStatusPill(context),
            ],
          ),
          LinearIndicator(progress: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${lastWorkingBPM ?? '-'} / $bpm BPM",
                style: context.numericS.copyWith(color: AppColors.darkInkMuted),
              ),
              Text(
                "${context.l10n.delivery}: ${parseDeliveryDate()}",
                style: context.bodySmall!.copyWith(
                  color: AppColors.darkInkMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStatusPill(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.space1,
        horizontal: context.space2,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkAccentWash,
        borderRadius: BorderRadius.circular(context.radiusPill),
        border: Border.all(width: 1, color: AppColors.darkAccentDim),
      ),
      child: Text(
        context.l10n.working,
        style: context.titleSmall!.copyWith(
          color: AppColors.darkAccentText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
