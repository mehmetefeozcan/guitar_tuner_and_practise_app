import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/utils/show_bottom_sheet.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/buttons/index.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FrequencySelectWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showGlobalBottomSheet<void>(
          buildSelectSheet(context),
          padding: context.screenPadding,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.space2,
          horizontal: context.space3,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkSurface200,
          borderRadius: BorderRadius.circular(context.radiusPill),
          border: Border.all(width: 1, color: AppColors.darkBorder),
        ),
        child: Text(
          "A4 440 Hz",
          style: context.numericS.copyWith(
            color: AppColors.darkInkMuted,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildSelectSheet(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.referenceFrequency,
                style: context.displaySmall!.copyWith(),
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  AppAssets.icons.close,
                  colorFilter: ColorFilter.mode(
                    AppColors.darkInkMuted,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          buildManuelConfig(context),
          SizedBox(height: 20.h),
          buildFrequentlyUsed(context),
          SizedBox(height: 20.h),
          Text(
            context.l10n.frequentlyUsedDesc,
            style: context.bodySmall!.copyWith(color: AppColors.darkInkSubtle),
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
                color: AppColors.onAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget buildCircleButton(BuildContext context, String icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkSurface300,
      ),
      padding: EdgeInsets.all(context.space4),
      child: Center(
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(AppColors.darkInk, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget buildManuelConfig(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 18.w,
      children: [
        buildCircleButton(context, AppAssets.icons.minus),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 2.h,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "440",
                    style: context.readoutXl.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "Hz",
                    style: context.labelLarge!.copyWith(
                      color: AppColors.darkInkMuted,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              context.l10n.defaultValue.toUpperCase(),
              style: context.titleSmall!.copyWith(
                color: AppColors.darkInkSubtle,
              ),
            ),
          ],
        ),
        buildCircleButton(context, AppAssets.icons.plus),
      ],
    );
  }

  Widget buildFrequentlyUsed(BuildContext context) {
    List items = [415, 432, 440, 442, 443];

    int selected = 440;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: context.space2,
      children: [
        Text(
          context.l10n.frequentlyUsed.toUpperCase(),
          style: context.titleSmall!.copyWith(color: AppColors.darkInkSubtle),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: context.space2,
          children: List.generate(
            items.length,
            (index) => Expanded(
              child: Container(
                width: context.width,
                padding: EdgeInsets.symmetric(vertical: context.space3),
                decoration: BoxDecoration(
                  color: items[index] == selected
                      ? AppColors.darkAccent
                      : AppColors.darkSurface300,
                  borderRadius: BorderRadius.circular(context.radiusPill),
                  border: Border.all(width: 1, color: AppColors.darkBorder),
                ),
                child: Center(
                  child: Text(
                    items[index].toString(),
                    style: context.numericS.copyWith(
                      color: items[index] == selected
                          ? AppColors.onAccent
                          : AppColors.darkInkSubtle,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
