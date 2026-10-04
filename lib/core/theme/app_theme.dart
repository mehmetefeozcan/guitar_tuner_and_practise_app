import 'package:guitar_tuner_and_practise_app/core/theme/app_semantic_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_theme_colors.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_theme.dart';

@singleton
class AppTheme {
  ThemeData get darkTheme => _build(
    scheme: AppThemeColors.dark,
    semantic: AppSemanticColors.dark,
    scaffold: AppColors.darkSurface100,
  );

  ThemeData get lightTheme => _build(
    scheme: AppThemeColors.light,
    semantic: AppSemanticColors.light,
    scaffold: AppColors.lightSurface100,
  );

  ThemeData _build({
    required ColorScheme scheme,
    required AppSemanticColors semantic,
    required Color scaffold,
  }) {
    final text = AppTextTheme.theme().apply(
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: text,

      // Ekran zemini surface100; kart ve panel surface200 (scheme.surface).
      scaffoldBackgroundColor: scaffold,
      canvasColor: scaffold,

      // Kâğıt yüzeyi, sinyal renkleri ve grafik serileri burada taşınır.
      extensions: <ThemeExtension<dynamic>>[semantic],

      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.displayM.copyWith(
          color: scheme.onSurface,
        ),
      ),

      // Derinliği yüzey basamağı anlatır, gölge değil.
      cardTheme: CardThemeData(
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // Birincil eylem: amber dolgu, koyu yazı. Ekranda tek tane olur.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHigh,
          disabledForegroundColor: scheme.onSurfaceVariant,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          textStyle: AppTextStyles.bodyStrong,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),

      // İkincil eylem: saydam, kontrol sınırı belli.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          side: BorderSide(color: scheme.outline),
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          textStyle: AppTextStyles.body,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),

      // Sade eylem: liste içi, kart başlığı yanı, "tümünü gör".
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: semantic.accentText,
          minimumSize: const Size(0, 44),
          textStyle: AppTextStyles.body,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        hintStyle: AppTextStyles.body.copyWith(color: scheme.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: scheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: scheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: semantic.focusRing, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: scheme.scrim,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: semantic.accentWash,
        elevation: 0,
        labelTextStyle: WidgetStatePropertyAll(AppTextStyles.label),
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: scheme.primary,
        inactiveTrackColor: scheme.surfaceContainerHigh,
        thumbColor: scheme.primary,
        overlayColor: semantic.accentWash,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.surfaceContainerHigh,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? scheme.onPrimary
              : scheme.onSurfaceVariant,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? scheme.primary
              : scheme.surfaceContainerHigh,
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),

      // Hareket bu üründe bir yerde iş yapar: metronom vuruşu ve akort
      // ibresi. Geri kalanı 120–180ms yer değiştirir; giriş animasyonu,
      // parıltı, kutlama yok.
      splashFactory: InkSparkle.splashFactory,
    );
  }
}
