import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter/widgets.dart';

/// Hazır akort düzenleri — kalın telden (6.) ince tele (1.) doğru sıralı.
///
/// Görünen ad burada tutulmaz, `label` ile l10n'den gelir.
enum TuningType {
  standard(['E2', 'A2', 'D3', 'G3', 'B3', 'E4']),
  dropD(['D2', 'A2', 'D3', 'G3', 'B3', 'E4']),
  halfStepDown(['Eb2', 'Ab2', 'Db3', 'Gb3', 'Bb3', 'Eb4']),
  halfStepUp(['F2', 'Bb2', 'Eb3', 'Ab3', 'C4', 'F4']),

  /// Hedef tel yok: duyulan en yakın nota gösterilir. Tel listesi boştur ve
  /// ekranda gizlenir; böylece her türlü özel akort düzeni çalınabilir.
  chromatic([]);

  const TuningType(this.strings);

  /// Tellerin hedef notaları, kalından inceye. Kromatikte boş.
  final List<String> strings;

  bool get isChromatic => this == TuningType.chromatic;

  String label(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      TuningType.standard => l10n.tuningStandard,
      TuningType.dropD => l10n.tuningDropD,
      TuningType.halfStepDown => l10n.tuningHalfStepDown,
      TuningType.halfStepUp => l10n.tuningHalfStepUp,
      TuningType.chromatic => l10n.tuningChromatic,
    };
  }
}
