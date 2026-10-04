import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemeColors {
  // ── Light ColorScheme ──────────────────────────────────────
  static const light = ColorScheme(
    brightness: Brightness.light,

    // Primary — #015CAB: buttons, active states, top bars
    primary: AppColors.primaryBlue,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primaryLight, // chip bg, FAB bg
    onPrimaryContainer: AppColors.primaryBlue, // text on primaryContainer
    // Secondary — #435477: labels, nav items, subtitles
    secondary: AppColors.darkGrey,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.greyLight,
    onSecondaryContainer: AppColors.darkGrey,

    // Tertiary — #F7941D: accent highlights, badges, CTAs
    tertiary: AppColors.orange,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.orangeLight,
    onTertiaryContainer: AppColors.orange,

    // Surface / Background — #EEF6F9 / #FFFFFF
    surface: AppColors.white,
    onSurface: AppColors.dark, // primary text on surface
    surfaceContainerHighest: AppColors.bgColor, // page scaffold bg
    onSurfaceVariant: AppColors.darkGrey, // secondary text on surface
    // Outline
    outline: AppColors.grey,
    outlineVariant: AppColors.greyLight,

    // Error — #AB0101
    error: AppColors.red,
    onError: AppColors.white,
    errorContainer: AppColors.redLight,
    onErrorContainer: AppColors.red,
  );
}
