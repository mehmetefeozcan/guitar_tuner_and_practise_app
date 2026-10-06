import 'package:flutter/material.dart';
import 'package:studio_accordo_app_mobile/core/theme/app_colors.dart';

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
      borderRadius: BorderRadius.circular(100),
      color: passiveColor,
      valueColor: AlwaysStoppedAnimation(activeColor),
      value: progress / 100,
    );
  }
}
