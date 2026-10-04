import 'package:guitar_tuner_and_practise_app/core/theme/app_semantic_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/text_theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/// Diyapazon'a özel erişimciler.
///
/// Mevcut `MainContextExtension`'ın yanında durur; oradaki Material slot
/// kısayolları (`context.bodyMedium`, `context.colors`, …) olduğu gibi kalır.
/// Buradakiler sistemin kendi sözlüğü.
///
/// Çakışma uyarısı: `MainContextExtension` içindeki `radiusSmall/Medium/Large`
/// 8/16/32 veriyor, Diyapazon'un ölçeği ise 4/8/12/18/999. İkisi bir arada
/// tutarsız sonuç verir — aşağıdaki [radiusSm] ailesine geçip o üçünü
/// silmeni öneririm.
extension DiyapazonTheme on BuildContext {
  /// Kâğıt yüzeyi, sinyal renkleri, amber varyantları ve grafik serileri.
  ///
  /// ```dart
  /// Container(color: context.ds.paper)
  /// ```
  AppSemanticColors get ds => Theme.of(this).extension<AppSemanticColors>()!;

  // ─── Adlandırılmış metin stilleri ───────────────────────────────────
  // Material slotlarının karşılığı olmayanlar ve sistemin kendi adları.

  /// 54/56 monospace — akort okuması, metronom BPM'i. Ekran başına tek.
  TextStyle get readoutXl => AppTextStyles.readoutXl;

  /// 24/28 monospace — istatistik değeri, seans süresi, skor.
  TextStyle get readout => AppTextStyles.readout;

  /// 13/18 monospace — tablatura rakamı, ölçü numarası, sent sapması.
  TextStyle get numericS => AppTextStyles.numericS;

  /// 12/16 büyük harf etiket. Büyük harfe widget tarafında çevir.
  TextStyle get labelStyle => AppTextStyles.label;

  /// 15/22 gövde içi vurgu.
  TextStyle get bodyStrong => AppTextStyles.bodyStrong;

  // ─── Boşluk · 4px tabanlı ───────────────────────────────────────────
  // Mevcut extension'daki oransal boşluklar (0.05.sh) ekran yüksekliğine
  // bağlı; sistemin ölçeği sabit adımlardan oluşur. İkisi farklı iş yapar:
  // oransal olanlar boş durum kompozisyonu için, bunlar düzen için.

  /// 4 — ikon ile etiket arası, rozet içi dikey dolgu.
  double get space1 => 4.w;

  /// 8 — satır içi öğeler arası, buton içi dikey dolgu.
  double get space2 => 8.w;

  /// 12 — kartlar arası dikey aralık, liste satırı dolgusu.
  double get space3 => 12.w;

  /// 16 — **ekran kenar boşluğu ve kart içi dolgu.** Varsayılan adım.
  double get space4 => 16.w;

  /// 24 — bölümler arası aralık, alt sayfa içi dolgu.
  double get space5 => 24.w;

  /// 32 — başlık ile içeriği arası, büyük bölüm ayrımı.
  double get space6 => 32.w;

  /// 48 — ekranın üst boşluğu, boş durum kompozisyonu.
  double get space7 => 48.w;

  /// 64 — tam ekran araçların (akort, metronom) çevresindeki nefes alanı.
  double get space8 => 64.w;

  /// Ekran kenar boşluğu — her ekranın gövdesi bununla sarılır.
  EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: 16.w);

  /// Kart içi dolgu.
  EdgeInsets get cardPadding => EdgeInsets.all(16.w);

  // ─── Yuvarlatma ─────────────────────────────────────────────────────
  // Ölçekte yukarı çıktıkça nesne büyür.

  /// 4 — rozet, küçük etiket, tablatura hücresi.
  double get radiusXs => 4.r;

  /// 8 — buton, girdi alanı, segmented control parçası.
  double get radiusSm => 8.r;

  /// 12 — kart, liste bloğu, istatistik kutusu.
  double get radiusMd => 12.r;

  /// 18 — alt sayfa, **nota sayfası yüzeyi**, tam genişlik panel.
  double get radiusLg => 18.r;

  /// Hap, çip, metronom vuruş noktası.
  double get radiusPill => 999.r;

  BorderRadius get borderRadiusXs => BorderRadius.circular(radiusXs);
  BorderRadius get borderRadiusSm => BorderRadius.circular(radiusSm);
  BorderRadius get borderRadiusMd => BorderRadius.circular(radiusMd);
  BorderRadius get borderRadiusLg => BorderRadius.circular(radiusLg);
  BorderRadius get borderRadiusPill => BorderRadius.circular(radiusPill);

  // ─── Kolaylıklar ────────────────────────────────────────────────────

  /// Nota sayfası kabı: kâğıt zemin, `radiusLg`, **gölgesiz.**
  ///
  /// ```dart
  /// DecoratedBox(decoration: context.paperSurface, child: scoreView)
  /// ```
  BoxDecoration get paperSurface =>
      BoxDecoration(color: ds.paper, borderRadius: borderRadiusLg);

  /// Kart kabı: `surface200`, `radiusMd`, gölgesiz — derinliği yüzey
  /// basamağı anlatır.
  BoxDecoration get cardSurface => BoxDecoration(
    color: Theme.of(this).colorScheme.surface,
    borderRadius: borderRadiusMd,
  );

  /// Bir sapmanın rengi: tolerans içindeyse doğru, dışındaysa hatalı.
  ///
  /// Renk **yönü söylemez** — pes de tiz de aynı rengi alır. Yönü ibrenin
  /// yeri, işaretli sayı ve üçgen işaret taşır; üçü her zaman birlikte.
  Color signalForCents(int cents, {int tolerance = 5}) =>
      cents.abs() <= tolerance ? ds.signalTrue : ds.signalOff;
}
