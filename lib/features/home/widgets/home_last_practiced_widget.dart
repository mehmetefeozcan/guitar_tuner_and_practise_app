import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/home/model/practice_entry.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/date_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

/// En son çalışılan parça — kullanıcının kaldığı yere dönüş satırı.
class HomeLastPracticedWidget extends StatelessWidget {
  final PracticeEntry entry;

  const new({super.key, required this.entry});

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
        color: context.colors.surfaceContainer,
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
                  color: context.ds.paper,
                  borderRadius: BorderRadius.circular(context.radiusSm),
                ),
                child: SvgPicture.asset(AppAssets.icons.notes),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(entry.pieceName, style: context.bodyMedium),
                  Text(
                    "${entry.date.relative(context)} %${entry.accuracy} ${context.l10n.accuracy} ",
                    style: context.numericS.copyWith(
                      color: context.ds.inkSubtle,
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
