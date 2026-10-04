import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class TunerReadoutWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: buildMajorTick(context),
          ),
          Positioned(left: 45.w, child: buildMinorTickGroup(context)),
          buildTolorenceBand(context),
          Positioned(right: 45.w, child: buildMinorTickGroup(context)),
          Align(
            alignment: Alignment.bottomRight,
            child: buildMajorTick(context),
          ),
          buildNeedle(context),
        ],
      ),
    );
  }

  Widget buildTolorenceBand(BuildContext context) {
    return Container(
      width: context.width * 0.13,
      height: 24.w,
      decoration: BoxDecoration(
        color: AppColors.darkAccentWash,
        border: Border.all(color: AppColors.darkAccentDim),
        borderRadius: BorderRadius.circular(context.radiusXs),
      ),
    );
  }

  Widget buildMajorTick(BuildContext context) {
    return Container(
      width: 1.w,
      height: 18.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBorderStrong),
      ),
    );
  }

  Widget buildMinorTick(BuildContext context) {
    return Container(
      width: 1.w,
      height: 10.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBorder),
      ),
    );
  }

  Widget buildMinorTickGroup(BuildContext context) {
    double spacing = 44.w;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: List.generate(3, (index) => buildMinorTick(context)),
    );
  }

  Widget buildNeedle(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 4.w),
      child: Container(
        width: 4.w,
        height: 42.w,
        decoration: BoxDecoration(
          color: AppColors.darkSignalOff,
          borderRadius: context.borderRadiusPill,
        ),
      ),
    );
  }
}
