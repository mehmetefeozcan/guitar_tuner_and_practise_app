import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  // ─── Başlık · Newsreader ────────────────────────────────────────────

  /// 40/44 · Karşılama ve boş durum ekranlarının tek başlığı.
  static TextStyle get displayXl => GoogleFonts.newsreader(
    fontSize: 40.sp,
    height: 44 / 40,
    fontWeight: FontWeight.w500,
  );

  /// 30/34 · Ekran başlıkları: kütüphane, ilerleme, ödevler.
  static TextStyle get displayL => GoogleFonts.newsreader(
    fontSize: 30.sp,
    height: 34 / 30,
    fontWeight: FontWeight.w500,
  );

  /// 23/28 · Eser adı, kart başlığı, alt sayfa başlığı.
  static TextStyle get displayM => GoogleFonts.newsreader(
    fontSize: 23.sp,
    height: 28 / 23,
    fontWeight: FontWeight.w500,
  );

  /// 19/24 · Bölüm başlıkları ve liste grubu başlıkları.
  static TextStyle get title => GoogleFonts.newsreader(
    fontSize: 19.sp,
    height: 24 / 19,
    fontWeight: FontWeight.w600,
  );

  // ─── Arayüz · Archivo ───────────────────────────────────────────────

  /// 15/22 · Gövde metni, liste satırı, buton yazısı.
  static TextStyle get body => GoogleFonts.archivo(
    fontSize: 15.sp,
    height: 22 / 15,
    fontWeight: FontWeight.w400,
  );

  /// 15/22 · Gövde içinde vurgu, liste satırının önde gelen değeri.
  static TextStyle get bodyStrong => GoogleFonts.archivo(
    fontSize: 15.sp,
    height: 22 / 15,
    fontWeight: FontWeight.w600,
  );

  /// 13/18 · Yardımcı metin, zaman damgası, alan altı açıklaması.
  static TextStyle get caption => GoogleFonts.archivo(
    fontSize: 13.sp,
    height: 18 / 13,
    fontWeight: FontWeight.w400,
  );

  /// 12/16 · Büyük harf bölüm etiketi ve rozet yazısı.
  ///
  /// Büyük harfe **CSS/widget tarafında** çevir (`Text(label.toUpperCase())`),
  /// veriyi büyük harf saklama.
  static TextStyle get label => GoogleFonts.archivo(
    fontSize: 12.sp,
    height: 16 / 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.08 * 12,
  );

  // ─── Ölçüm · IBM Plex Mono ──────────────────────────────────────────

  /// 54/56 · Akort ekranının ana okuması ve metronom BPM'i. Ekran başına tek.
  static TextStyle get readoutXl => GoogleFonts.ibmPlexMono(
    fontSize: 54.sp,
    height: 56 / 54,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// 24/28 · İstatistik kutularının değeri, seans süresi, skor.
  static TextStyle get readout => GoogleFonts.ibmPlexMono(
    fontSize: 24.sp,
    height: 28 / 24,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// 13/18 · Tablatura rakamları, ölçü numaraları, sent sapması, sütunda
  /// hizalanan her sayı.
  static TextStyle get numericS => GoogleFonts.ibmPlexMono(
    fontSize: 13.sp,
    height: 18 / 13,
    fontWeight: FontWeight.w400,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}

/// Material `TextTheme` — [AppTextStyles] üzerine kurulu, ikinci bir kaynak
/// değil. Material widget'ları (AppBar, ListTile, ElevatedButton, …) buradan
/// okur.
///
/// Diyapazon'un kendi adlarını kullanmak her zaman daha açıktır; bu eşleme
/// yalnızca hazır Material widget'larının doğru görünmesi için var.
class AppTextTheme {
  const AppTextTheme._();

  static TextTheme theme() {
    return TextTheme(
      // Başlık yüzü
      displayLarge: AppTextStyles.displayXl,
      displayMedium: AppTextStyles.displayL,
      displaySmall: AppTextStyles.displayM,
      headlineLarge: AppTextStyles.displayL,
      headlineMedium: AppTextStyles.displayM,
      headlineSmall: AppTextStyles.title,
      titleLarge: AppTextStyles.title,

      // Arayüz yüzü
      titleMedium: AppTextStyles.bodyStrong,
      titleSmall: AppTextStyles.label,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.caption,
      labelLarge: AppTextStyles.bodyStrong,
      labelMedium: AppTextStyles.label,
      labelSmall: AppTextStyles.label,
    );
  }
}
