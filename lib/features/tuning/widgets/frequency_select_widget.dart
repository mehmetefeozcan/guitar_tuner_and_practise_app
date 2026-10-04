import 'package:flutter/material.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

class FrequencySelectWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
