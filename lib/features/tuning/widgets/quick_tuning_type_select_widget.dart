import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:flutter/material.dart';

class QuickTuningTypeSelectWidget extends StatelessWidget {
  const new({super.key});

  static int selected = 0;
  static List<String> types = [
    "Standart",
    "Drop D",
    "Half Bemol",
    "Half Sharp",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: context.space2,
        children: List.generate(
          types.length,
          (index) => buildTuningType(context, index),
        ),
      ),
    );
  }

  Widget buildTuningType(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.space2,
        horizontal: context.space6,
      ),

      decoration: BoxDecoration(
        color: index == selected
            ? AppColors.darkAccent
            : AppColors.darkSurface200,
        borderRadius: BorderRadius.circular(context.radiusPill),
        border: Border.all(width: 1, color: AppColors.darkBorder),
      ),
      child: Text(
        types[index],
        style: context.numericS.copyWith(
          color: index == selected
              ? AppColors.onAccent
              : AppColors.darkInkMuted,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
