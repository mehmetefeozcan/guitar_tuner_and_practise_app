import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

class HomeLastPracticedWidget extends StatelessWidget {
  final String pieceName;
  final DateTime lastPracticeDate;
  final int accuracy;

  const new({
    super.key,
    required this.pieceName,
    required this.lastPracticeDate,
    required this.accuracy,
  });

  String parseLastPractiseDate(BuildContext context) {
    final l10n = context.l10n;
    final now = Moment.now();

    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(
      lastPracticeDate.year,
      lastPracticeDate.month,
      lastPracticeDate.day,
    );

    final diffDays = today.difference(target).inDays;

    if (diffDays <= 0) {
      return l10n.today;
    }

    if (diffDays == 1) {
      return l10n.yesterday;
    }

    if (diffDays < 7) {
      return l10n.daysAgo(diffDays);
    }

    if (diffDays < 30) {
      final weeks = diffDays ~/ 7;
      return weeks == 1 ? l10n.weekAgo(weeks) : l10n.weeksAgo(weeks);
    }

    if (diffDays < 365) {
      final months = diffDays ~/ 30;
      return months == 1 ? l10n.monthAgo(months) : l10n.monthsAgo(months);
    }

    final years = diffDays ~/ 365;
    return years == 1 ? l10n.yearAgo(years) : l10n.yearsAgo(years);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.space2,
      children: [
        Text(context.l10n.lastPracticed, style: context.titleLarge),
        buildLastPracticed(context),
      ],
    );
  }

  Widget buildLastPracticed(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface200,
        borderRadius: BorderRadius.circular(context.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: context.space3,
            children: [
              Container(
                padding: EdgeInsets.all(context.space1),
                decoration: BoxDecoration(
                  color: AppColors.darkPaper,
                  borderRadius: BorderRadius.circular(context.radiusSm),
                ),
                child: SvgPicture.asset(AppAssets.icons.notes),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(pieceName, style: context.bodyMedium),
                  Text(
                    "${parseLastPractiseDate(context)} %$accuracy ${context.l10n.accuracy} ",
                    style: context.numericS.copyWith(
                      color: AppColors.darkInkSubtle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(AppAssets.icons.chevron),
        ],
      ),
    );
  }
}
