import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeColors {
  const AppThemeColors._();

  /// Birincil tema. Sistem koyu öncelikli kurgulandı.
  static const dark = ColorScheme(
    brightness: Brightness.dark,

    // Marka amberi — birincil buton, aktif sekme, ilerleme dolgusu
    primary: AppColors.darkAccent,
    onPrimary: AppColors.onAccent,
    primaryContainer: AppColors.darkAccentWash,
    onPrimaryContainer: AppColors.darkAccentText,

    // İkincil metin ve nötr kontroller
    secondary: AppColors.darkInkMuted,
    onSecondary: AppColors.darkSurface100,
    secondaryContainer: AppColors.darkSurface300,
    onSecondaryContainer: AppColors.darkInk,

    // Doğru / tamamlandı
    tertiary: AppColors.darkSignalTrue,
    onTertiary: AppColors.darkSurface100,
    tertiaryContainer: AppColors.darkSurface200,
    onTertiaryContainer: AppColors.darkSignalTrue,

    // Yüzey basamakları — derinliği bunlar anlatır, gölge değil
    surface: AppColors.darkSurface200,
    onSurface: AppColors.darkInk,
    onSurfaceVariant: AppColors.darkInkMuted,
    surfaceContainerLowest: AppColors.darkSurface000,
    surfaceContainerLow: AppColors.darkSurface100,
    surfaceContainer: AppColors.darkSurface200,
    surfaceContainerHigh: AppColors.darkSurface300,
    surfaceContainerHighest: AppColors.darkSurfaceOverlay,
    surfaceDim: AppColors.darkSurface000,
    surfaceBright: AppColors.darkSurfaceOverlay,

    // Kenarlıklar: outline kontrol sınırı (3:1), outlineVariant sade ayraç
    outline: AppColors.darkBorderStrong,
    outlineVariant: AppColors.darkBorder,

    // Doğru olmayan her şey
    error: AppColors.darkSignalOff,
    onError: AppColors.onAccent,
    errorContainer: AppColors.darkSurface300,
    onErrorContainer: AppColors.darkSignalOff,

    scrim: AppColors.darkScrim,
    shadow: AppColors.darkShadowOverlay,
    inverseSurface: AppColors.lightSurface200,
    onInverseSurface: AppColors.lightInk,
    inversePrimary: AppColors.lightAccent,
  );

  /// Açık tema. Koyu temadan türetildi — `paper*` tokenları **değişmez**,
  /// nota her iki temada da kâğıt olarak okunur.
  static const light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.lightAccent,
    onPrimary: AppColors.onAccent,
    primaryContainer: AppColors.lightAccentWash,
    onPrimaryContainer: AppColors.lightAccentText,

    secondary: AppColors.lightInkMuted,
    onSecondary: AppColors.lightSurface100,
    secondaryContainer: AppColors.lightSurface300,
    onSecondaryContainer: AppColors.lightInk,

    tertiary: AppColors.lightSignalTrue,
    onTertiary: AppColors.lightSurface100,
    tertiaryContainer: AppColors.lightSurface200,
    onTertiaryContainer: AppColors.lightSignalTrue,

    surface: AppColors.lightSurface200,
    onSurface: AppColors.lightInk,
    onSurfaceVariant: AppColors.lightInkMuted,
    surfaceContainerLowest: AppColors.lightSurface200,
    surfaceContainerLow: AppColors.lightSurface100,
    surfaceContainer: AppColors.lightSurface000,
    surfaceContainerHigh: AppColors.lightSurface300,
    surfaceContainerHighest: AppColors.lightSurface300,
    surfaceDim: AppColors.lightSurface000,
    surfaceBright: AppColors.lightSurface200,

    outline: AppColors.lightBorderStrong,
    outlineVariant: AppColors.lightBorder,

    error: AppColors.lightSignalOff,
    onError: AppColors.lightSurface100,
    errorContainer: AppColors.lightSurface300,
    onErrorContainer: AppColors.lightSignalOff,

    scrim: AppColors.lightScrim,
    shadow: AppColors.lightShadowOverlay,
    inverseSurface: AppColors.darkSurface200,
    onInverseSurface: AppColors.darkInk,
    inversePrimary: AppColors.darkAccent,
  );
}
