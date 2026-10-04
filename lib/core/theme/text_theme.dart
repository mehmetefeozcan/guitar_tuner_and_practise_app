import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme theme() {
    return TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 56.sp,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 48.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 32.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 6.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
