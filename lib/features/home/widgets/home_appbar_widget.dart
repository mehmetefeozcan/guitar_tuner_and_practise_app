import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:moment_dart/moment_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppbarWidget extends StatelessWidget {
  const new({super.key});

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
              style: context.labelStyle.copyWith(
                color: AppColors.darkInkSubtle,
              ),
            ),
            Text(
              "Good evening",
              style: context.displayMedium!.copyWith(color: AppColors.darkInk),
            ),
          ],
        ),

        SvgPicture.asset(
          AppAssets.icons.settings,
          colorFilter: ColorFilter.mode(
            AppColors.darkInkMuted,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
