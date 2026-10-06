import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/model/greeting_kind.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

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
