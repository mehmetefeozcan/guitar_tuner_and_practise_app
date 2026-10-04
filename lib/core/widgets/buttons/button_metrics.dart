import 'package:flutter/material.dart';

import '../../theme/text_theme.dart';

/// Buton boyları. Diyapazon'un üç boyu var ve her birinin işi belli.
enum AppButtonSize {
  /// 13px yazı, sıkı dolgu — liste satırı içi, kart başlığı yanı.
  ///
  /// Görsel yüksekliği küçük ama dokunma hedefi 44'ün altına inmez.
  sm,

  /// 15px yazı — varsayılan. Ekranların çoğunda bu kullanılır.
  md,

  /// 17px yazı, geniş dolgu — tam ekran araçların tek eylemi
  /// (akordu başlat, kaydı bitir).
  lg,
}

/// Bir boya karşılık gelen ölçüler.
///
/// Dokunma hedefi ile görsel dolgu ayrı tutulur: [minHeight] dokunulabilir
/// alanı, [padding] görünen dolguyu belirler. `sm` görsel olarak küçük
/// kalırken dokunma hedefi yine 44'tür — mobilde bu pazarlık konusu değil.
extension AppButtonMetrics on AppButtonSize {
  double get minHeight => switch (this) {
    AppButtonSize.sm => 44,
    AppButtonSize.md => 48,
    AppButtonSize.lg => 56,
  };

  EdgeInsets get padding => switch (this) {
    AppButtonSize.sm => const EdgeInsets.symmetric(horizontal: 12),
    AppButtonSize.md => const EdgeInsets.symmetric(horizontal: 16),
    AppButtonSize.lg => const EdgeInsets.symmetric(horizontal: 24),
  };

  /// Yazı stili. `sm` ve `md` arayüz yüzünde, `lg` bir tık büyük.
  TextStyle get textStyle => switch (this) {
    AppButtonSize.sm => AppTextStyles.caption.copyWith(
      fontWeight: FontWeight.w600,
    ),
    AppButtonSize.md => AppTextStyles.bodyStrong,
    AppButtonSize.lg => AppTextStyles.bodyStrong.copyWith(fontSize: 17),
  };
}

/// Butonun anlamı. Rengi bu belirler, çağıran yer değil.
enum AppButtonTone {
  /// Olağan eylem.
  normal,

  /// Geri alınamaz işlem: kayıt silme, ödev iptali.
  ///
  /// Diyapazon'da yıkıcı eylem **dolgulu değil kenarlıklıdır** — yıkıcı bir
  /// işlem hiçbir zaman ekranın amber eylemi değildir. Bu yüzden
  /// [AppButtonTone.danger] yalnızca `CustomOutlinedButton`'da anlam taşır.
  danger,
}
