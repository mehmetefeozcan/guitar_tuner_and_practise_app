import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/reference_frequency.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/buttons/index.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Referans frekansı alt sayfası: `−` / `+` ile serbest ayar, altında sık
/// kullanılan değerler.
class FrequencySelectSheet extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(context),
          SizedBox(height: 28.h),
          buildManuelConfig(context),
          SizedBox(height: 20.h),
          buildFrequentlyUsed(context),
          SizedBox(height: 20.h),
          Text(
            context.l10n.frequentlyUsedDesc,
            style: context.bodySmall!.copyWith(color: context.ds.inkSubtle),
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            onPressed: () {
              context.pop();
            },
            expand: true,
            child: Text(
              context.l10n.done,
              style: context.bodyMedium!.copyWith(
                color: context.colors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(context.l10n.referenceFrequency, style: context.displaySmall),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(
            AppAssets.icons.close,
            colorFilter: ColorFilter.mode(
              context.colors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildManuelConfig(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 18.w,
      children: [
        IconCircleButton(
          icon: AppAssets.icons.minus,
          onPressed: () => store.nudgeReferenceHz(-1),
        ),
        Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2.h,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: store.referenceHz.toStringAsFixed(0),
                      style: context.readoutXl.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "Hz",
                      style: context.labelLarge!.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                context.l10n.defaultValue.toUpperCase(),
                style: context.titleSmall!.copyWith(
                  color: context.ds.inkSubtle,
                ),
              ),
            ],
          ),
        ),
        IconCircleButton(
          icon: AppAssets.icons.plus,
          onPressed: () => store.nudgeReferenceHz(1),
        ),
      ],
    );
  }

  Widget buildFrequentlyUsed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: context.space2,
      children: [
        Text(
          context.l10n.frequentlyUsed.toUpperCase(),
          style: context.titleSmall!.copyWith(color: context.ds.inkSubtle),
        ),
        Observer(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: context.space2,
            children: ReferenceFrequency.presets
                .map(
                  (preset) => Expanded(child: buildPreset(context, preset)),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildPreset(BuildContext context, double preset) {
    final selected = preset == store.referenceHz;

    return GestureDetector(
      onTap: () => store.setReferenceHz(preset),
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(vertical: context.space3),
        decoration: BoxDecoration(
          color: selected
              ? context.colors.primary
              : context.colors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(context.radiusPill),
          border: Border.all(width: 1, color: context.colors.outlineVariant),
        ),
        child: Center(
          child: Text(
            preset.toStringAsFixed(0),
            style: context.numericS.copyWith(
              color: selected
                  ? context.colors.onPrimary
                  : context.ds.inkSubtle,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
