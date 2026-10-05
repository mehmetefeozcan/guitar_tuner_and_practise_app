import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/store/tuning_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Sapmanın sent cinsinden okuması: işaret, değer ve yön kelimesi.
///
/// Renk yalnızca doğruluğu söyler; yönü işaret ikonu ile yanındaki kelime
/// taşır (bkz. `AppSemanticColors.signalOff`).
class TunerCentsWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final cents = store.reading?.cents;
        final inTune = store.isInTune;

        final color = inTune ? context.ds.signalTrue : context.ds.signalOff;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          spacing: context.space2,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (cents != null && !inTune)
                  SvgPicture.asset(
                    cents < 0 ? AppAssets.icons.minus : AppAssets.icons.plus,
                    width: 32.w,
                    height: 32.w,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                Text(
                  cents == null ? "—" : cents.abs().round().toString(),
                  style: context.readoutXl.copyWith(
                    fontSize: 42.sp,
                    color: color,
                  ),
                ),
              ],
            ),
            Text(
              label(context, cents, inTune).toUpperCase(),
              style: context.titleSmall!.copyWith(color: color),
            ),
          ],
        );
      },
    );
  }

  String label(BuildContext context, double? cents, bool inTune) {
    if (cents == null) return "";
    if (inTune) return context.l10n.inTune;

    return cents < 0 ? context.l10n.flat : context.l10n.sharp;
  }
}
