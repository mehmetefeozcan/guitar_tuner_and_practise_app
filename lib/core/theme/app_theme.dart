import 'package:guitar_tuner_and_practise_app/core/theme/app_theme_colors.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_theme.dart';

@singleton
class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgColor,
      textTheme: AppTextTheme.theme(),
      colorScheme: AppThemeColors.light,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
