import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/home/model/greeting_kind.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';

import 'package:moment_dart/moment_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Tarih, günün selamı ve ayarlar.
class HomeAppbarWidget extends StatelessWidget {
  final GreetingKind greeting;

  const new({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.space1,
          children: [
            Text(
              Moment.now().format("dddd, DD MMMM", true),
              style: context.labelStyle.copyWith(color: context.ds.inkSubtle),
            ),
            Text(
              greeting.label(context),
              style: context.displayMedium!.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ],
        ),

        SvgPicture.asset(
          AppAssets.icons.settings,
          colorFilter: ColorFilter.mode(
            context.colors.onSurfaceVariant,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
