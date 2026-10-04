import 'package:flutter/material.dart';

class AppColors {
  static const Color brandNavy = Color(0xFF16249E);
  static const Color burgundy = Color(0xFF9e263d);

  static const LinearGradient brandBordoGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF5F192F), Color(0xFF821235), Color(0xFFA60C3C)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient redNavyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [brandNavy, brandNavy, Color(0xFF5F192F)],
    stops: [0.0, 0.8, 1.0],
  );

  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color blueDark = Color(0xFF1E3A8A);
  static const Color blueLight = Color(0xFF0EA5E9);
  static const Color darkGrey = Color(0xFF435477);
  static const Color grey = Color(0xFF94A3B8);
  static const Color orange = Color(0xFFF7941D);
  static const Color bgColor = Color(0xFFEEF6F9);
  static const Color dark = Color(0xFF111827);
  static const Color green = Color(0xFF16CF16);
  static const Color red = Color(0xFFAB0101);
  static const Color hint = Color(0xFFD1D5DB);
  static const Color border = Color(0xFFE2E8F0);

  static const Color white = Color(0xFFFFFFFF);
  static const Color halfWhite = Color(0x80FFFFFF);
  static const Color quarterWhite = Color(0x40FFFFFF);

  static const Color primaryLight = Color(0xFFD6E8F7);
  static const Color orangeLight = Color(0xFFFEEDD4);
  static const Color greenLight = Color(0xFFD4F8D4);
  static const Color redLight = Color(0xFFF5D0D0);
  static const Color greyLight = Color(0xFFEEF2F8);
  static const Color brandNavyLight = Color(0xFFDDE1F5);
  static const Color brandBordoLight = Color(0xFFF5DCE3);

  static const Color secondary = darkGrey;
  static const Color accent = orange;
  static const Color textPrimary = dark;
  static const Color textSecondary = darkGrey;
  static const Color textMuted = grey;
  static const Color background = bgColor;
  static const Color surface = white;
  static const Color surfaceMuted = Color(0xFFFAFBFC);

  static const Color success = green;
  static const Color successBg = greenLight;
  static const Color error = red;
  static const Color errorBg = redLight;
  static const Color warning = orange;
  static const Color warningBg = orangeLight;
  static const Color info = primaryBlue;
  static const Color infoBg = primaryLight;
  static const Color disabled = grey;
  static const Color disabledBg = greyLight;

  static const Color primary = brandNavy;
  static const Color primaryLightBrand = brandNavyLight;

  static const Color cardBorder = border;
  static const Color inputBg = greyLight;
  static const Color inputHint = hint;
}
