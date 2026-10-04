import 'package:flutter/material.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

class LinearIndicator extends StatelessWidget {
  final Color activeColor;
  final Color passiveColor;

  /// [0-100] range acceptable
  final double progress;

  const new({
    super.key,
    required this.progress,
    this.activeColor = AppColors.darkAccent,
    this.passiveColor = AppColors.darkBorder,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: passiveColor,
      valueColor: AlwaysStoppedAnimation(activeColor),
      value: progress / 100,
    );
  }
}
