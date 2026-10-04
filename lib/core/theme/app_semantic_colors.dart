import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Material'ın `ColorScheme`'inde karşılığı olmayan Diyapazon tokenları.
///
/// `ColorScheme` genel amaçlı bir arayüz; bu uygulamanın iki şeye ihtiyacı var
/// ve ikisi de orada yok:
///
///  * **Kâğıt yüzeyi** (`paper*`) — nota sayfası, her iki temada da açık kalır.
///    `ColorScheme`'in tüm yüzeyleri temayla döner, bu dönmez.
///  * **Sinyal renkleri** (`signalTrue` / `signalOff`) — `error` tek başına
///    "akortta değil" durumunu anlatmaya yetmez, `tertiary` ise semantik
///    değildir.
///
/// Ayrıca amberin metin / zemin / kenar varyantları ile grafik serileri burada.
///
/// Kullanımı (bkz. `theme_context_extension.dart`):
/// ```dart
/// Container(color: context.ds.paper)
/// Text('−12', style: AppTextStyles.readout.copyWith(color: context.ds.signalOff))
/// ```
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.paper,
    required this.paperInk,
    required this.paperLine,
    required this.paperMuted,
    required this.paperAccent,
    required this.focusRingPaper,
    required this.focusRing,
    required this.accentText,
    required this.accentWash,
    required this.accentDim,
    required this.signalTrue,
    required this.signalOff,
    required this.dataPractice,
    required this.dataTempo,
    required this.dataAccuracy,
    required this.dataSessions,
    required this.dataGrid,
    required this.shadowRaised,
    required this.shadowOverlay,
  });

  // ─── Paper · nota sayfası ───────────────────────────────────────────
  // Kâğıdın üzerinde chrome tokenı kullanılmaz. Kâğıt radiusLg ile
  // yuvarlatılır, surface100 üzerinde durur ve gölge almaz.

  /// Nota sayfasının yüzeyi.
  final Color paper;

  /// Nota başları, saplar, bayraklar, anahtarlar, es'ler.
  final Color paperInk;

  /// Porte çizgileri, ölçü çizgileri, ek çizgiler, tablatura çizgileri.
  final Color paperLine;

  /// Parmak numaraları, ölçü numaraları, tablatura rakamları.
  final Color paperMuted;

  /// O an tınlayan veya seçili ölçünün zemini. Üstündeki nota [paperInk]
  /// kalır — vurgu ölçünün tamamını kaplar, tek notayı değil.
  final Color paperAccent;

  /// Kâğıt üzerindeki odak halkası. [focusRing] kâğıtta kaybolur.
  final Color focusRingPaper;

  // ─── Odak ───────────────────────────────────────────────────────────
  /// Chrome yüzeylerinde klavye odağı: 2px kalınlık, 2px offset.
  final Color focusRing;

  // ─── Amber varyantları ──────────────────────────────────────────────
  /// Amber **metin** ve ikonlar. `colorScheme.primary` metin olarak açık
  /// temada 4.5:1 tutmaz; amber yazı her zaman bunu kullanır.
  final Color accentText;

  /// Amber içeriğin arkasındaki kısık zemin: seçili satır, aktif pratik
  /// bandı, ipucu kutusu.
  final Color accentWash;

  /// Amber kenarlıklar ve ayraçlar, metronomun henüz çalmamış vuruşları.
  final Color accentDim;

  // ─── Durum ──────────────────────────────────────────────────────────
  /// Doğru olan her şey: akortta, doğru nota, tamamlanmış ödev.
  final Color signalTrue;

  /// Doğru olmayan her şey: pes, tiz, yanlış nota, atlanan ölçü.
  ///
  /// **Renk doğruluğu söyler, yönü söylemez.** Pes ve tiz aynı renktir; yön
  /// ibrenin yerinde, işaretli sayıda ve üçgen işarette okunur. Bu renk
  /// hiçbir yerde tek başına görünmez — yanında her zaman bir kelime ya da
  /// biçim bulunur.
  final Color signalOff;

  // ─── Grafik serileri ────────────────────────────────────────────────
  final Color dataPractice;
  final Color dataTempo;
  final Color dataAccuracy;
  final Color dataSessions;

  /// Yalnızca ızgara çizgileri. Eksen etiketleri `onSurfaceVariant` kullanır.
  final Color dataGrid;

  /// Kategorik seri sırası — **sabittir, döngüye sokulmaz.** Renk seriyi
  /// takip eder, sırasını değil: bir filtre seri sayısını değiştirdiğinde
  /// kalanlar yeniden boyanmaz. Dörtten fazla seri varsa kırp, katla veya
  /// küçük çoklu kullan; beşinci bir renk üretme.
  List<Color> get dataSeries => [
    dataPractice,
    dataTempo,
    dataAccuracy,
    dataSessions,
  ];

  // ─── Gölge ──────────────────────────────────────────────────────────
  // Derinliği gölge değil yüzey basamağı yapar. Bunlar yalnızca gerçekten
  // zeminden ayrılması gereken kart ve yüzen katmanlar için.

  /// `surface200` kartların zeminden ayrılması. Tek katman, 2px'i geçmez.
  final List<BoxShadow> shadowRaised;

  /// Menü, popover, alt sayfa — gerçekten yüzen katmanlar.
  final List<BoxShadow> shadowOverlay;

  // ─── Temalar ────────────────────────────────────────────────────────

  static const dark = AppSemanticColors(
    paper: AppColors.darkPaper,
    paperInk: AppColors.darkPaperInk,
    paperLine: AppColors.darkPaperLine,
    paperMuted: AppColors.darkPaperMuted,
    paperAccent: AppColors.darkPaperAccent,
    focusRingPaper: AppColors.focusRingPaper,
    focusRing: AppColors.darkFocusRing,
    accentText: AppColors.darkAccentText,
    accentWash: AppColors.darkAccentWash,
    accentDim: AppColors.darkAccentDim,
    signalTrue: AppColors.darkSignalTrue,
    signalOff: AppColors.darkSignalOff,
    dataPractice: AppColors.darkDataPractice,
    dataTempo: AppColors.darkDataTempo,
    dataAccuracy: AppColors.darkDataAccuracy,
    dataSessions: AppColors.darkDataSessions,
    dataGrid: AppColors.darkDataGrid,
    shadowRaised: [
      BoxShadow(
        color: AppColors.darkShadowRaised,
        offset: Offset(0, 1),
        blurRadius: 2,
      ),
    ],
    shadowOverlay: [
      BoxShadow(
        color: AppColors.darkShadowOverlay,
        offset: Offset(0, 8),
        blurRadius: 24,
      ),
    ],
  );

  static const light = AppSemanticColors(
    paper: AppColors.lightPaper,
    paperInk: AppColors.lightPaperInk,
    paperLine: AppColors.lightPaperLine,
    paperMuted: AppColors.lightPaperMuted,
    paperAccent: AppColors.lightPaperAccent,
    focusRingPaper: AppColors.focusRingPaper,
    focusRing: AppColors.lightFocusRing,
    accentText: AppColors.lightAccentText,
    accentWash: AppColors.lightAccentWash,
    accentDim: AppColors.lightAccentDim,
    signalTrue: AppColors.lightSignalTrue,
    signalOff: AppColors.lightSignalOff,
    dataPractice: AppColors.lightDataPractice,
    dataTempo: AppColors.lightDataTempo,
    dataAccuracy: AppColors.lightDataAccuracy,
    dataSessions: AppColors.lightDataSessions,
    dataGrid: AppColors.lightDataGrid,
    shadowRaised: [
      BoxShadow(
        color: AppColors.lightShadowRaised,
        offset: Offset(0, 1),
        blurRadius: 2,
      ),
    ],
    shadowOverlay: [
      BoxShadow(
        color: AppColors.lightShadowOverlay,
        offset: Offset(0, 8),
        blurRadius: 24,
      ),
    ],
  );

  @override
  AppSemanticColors copyWith({
    Color? paper,
    Color? paperInk,
    Color? paperLine,
    Color? paperMuted,
    Color? paperAccent,
    Color? focusRingPaper,
    Color? focusRing,
    Color? accentText,
    Color? accentWash,
    Color? accentDim,
    Color? signalTrue,
    Color? signalOff,
    Color? dataPractice,
    Color? dataTempo,
    Color? dataAccuracy,
    Color? dataSessions,
    Color? dataGrid,
    List<BoxShadow>? shadowRaised,
    List<BoxShadow>? shadowOverlay,
  }) {
    return AppSemanticColors(
      paper: paper ?? this.paper,
      paperInk: paperInk ?? this.paperInk,
      paperLine: paperLine ?? this.paperLine,
      paperMuted: paperMuted ?? this.paperMuted,
      paperAccent: paperAccent ?? this.paperAccent,
      focusRingPaper: focusRingPaper ?? this.focusRingPaper,
      focusRing: focusRing ?? this.focusRing,
      accentText: accentText ?? this.accentText,
      accentWash: accentWash ?? this.accentWash,
      accentDim: accentDim ?? this.accentDim,
      signalTrue: signalTrue ?? this.signalTrue,
      signalOff: signalOff ?? this.signalOff,
      dataPractice: dataPractice ?? this.dataPractice,
      dataTempo: dataTempo ?? this.dataTempo,
      dataAccuracy: dataAccuracy ?? this.dataAccuracy,
      dataSessions: dataSessions ?? this.dataSessions,
      dataGrid: dataGrid ?? this.dataGrid,
      shadowRaised: shadowRaised ?? this.shadowRaised,
      shadowOverlay: shadowOverlay ?? this.shadowOverlay,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      paper: Color.lerp(paper, other.paper, t)!,
      paperInk: Color.lerp(paperInk, other.paperInk, t)!,
      paperLine: Color.lerp(paperLine, other.paperLine, t)!,
      paperMuted: Color.lerp(paperMuted, other.paperMuted, t)!,
      paperAccent: Color.lerp(paperAccent, other.paperAccent, t)!,
      focusRingPaper: Color.lerp(focusRingPaper, other.focusRingPaper, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      accentWash: Color.lerp(accentWash, other.accentWash, t)!,
      accentDim: Color.lerp(accentDim, other.accentDim, t)!,
      signalTrue: Color.lerp(signalTrue, other.signalTrue, t)!,
      signalOff: Color.lerp(signalOff, other.signalOff, t)!,
      dataPractice: Color.lerp(dataPractice, other.dataPractice, t)!,
      dataTempo: Color.lerp(dataTempo, other.dataTempo, t)!,
      dataAccuracy: Color.lerp(dataAccuracy, other.dataAccuracy, t)!,
      dataSessions: Color.lerp(dataSessions, other.dataSessions, t)!,
      dataGrid: Color.lerp(dataGrid, other.dataGrid, t)!,
      shadowRaised:
          BoxShadow.lerpList(shadowRaised, other.shadowRaised, t) ??
          shadowRaised,
      shadowOverlay:
          BoxShadow.lerpList(shadowOverlay, other.shadowOverlay, t) ??
          shadowOverlay,
    );
  }
}
