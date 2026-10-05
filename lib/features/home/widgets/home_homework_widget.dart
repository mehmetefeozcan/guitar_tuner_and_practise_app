import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/home/model/homework_item.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/index.dart';

import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

/// Üzerinde çalışılan ödev kartı: eser, ölçü aralığı, tempo ve teslim günü.
class HomeHomeworkWidget extends StatelessWidget {
  final HomeworkItem item;

  const new({super.key, required this.item});

  String details(BuildContext context) {
    String text = "";

    if (item.hasBarRange) {
      text += "${context.l10n.bars} ${item.minBar}-${item.maxBar}";
    }

    if (item.bpm != null) {
      text += " · ${context.l10n.targetBPM(item.bpm!)} ";
    }

    return text;
  }

  String parseDeliveryDate() {
    final delivery = item.delivery;

    if (delivery == null) return "";

    final moment = Moment(delivery);
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
          style: context.bodySmall!.copyWith(color: context.ds.accentText),
        ),
      ],
    );
  }

  Widget buildHomeworkCard(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.cardPadding,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
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
                  Text(item.pieceName, style: context.titleMedium),
                  Text(
                    details(context),
                    style: context.numericS.copyWith(
                      color: context.ds.inkSubtle,
                    ),
                  ),
                ],
              ),
              buildStatusPill(context),
            ],
          ),
          LinearIndicator(progress: item.progress),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.lastWorkingBpm ?? '-'} / ${item.bpm} BPM",
                style: context.numericS.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              Text(
                "${context.l10n.delivery}: ${parseDeliveryDate()}",
                style: context.bodySmall!.copyWith(
                  color: context.colors.onSurfaceVariant,
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
        color: context.ds.accentWash,
        borderRadius: BorderRadius.circular(context.radiusPill),
        border: Border.all(width: 1, color: context.ds.accentDim),
      ),
      child: Text(
        context.l10n.working,
        style: context.titleSmall!.copyWith(
          color: context.ds.accentText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
