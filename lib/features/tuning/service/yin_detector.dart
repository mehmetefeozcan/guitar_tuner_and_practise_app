import 'dart:typed_data';
import 'dart:math';

/// YIN'in tek bir çerçeve için sonucu.
class YinResult {
  /// `null` ise çerçevede periyodik bir perde bulunamadı.
  final double? frequency;

  /// 0..1 arası: `1 - d'(tau)`. Yüksek değer periyodik, güvenilir ölçümdür.
  final double confidence;

  const YinResult(this.frequency, this.confidence);

  static const unvoiced = YinResult(null, 0);
}

/// de Cheveigné & Kawahara (2002) YIN algoritması.
///
/// Adımlar: fark fonksiyonu → kümülatif ortalama normalize fark (CMND) →
/// mutlak eşik → parabolik interpolasyon. Saf Dart; platform veya paket
/// bağımlılığı yok, bu yüzden isolate içinde ve testte aynen çalışır.
///
/// Arama aralığı [minFrequency]..[maxFrequency] ile sınırlıdır. Alt tellerde
/// oktav hatasını (E2'yi E3 sanma) engelleyen asıl şey budur: [minFrequency]
/// en pes hedef telin bir oktav altına asla inmemelidir.
class YinDetector {
  final int sampleRate;
  final double minFrequency;
  final double maxFrequency;

  /// Mutlak eşik. Düşük değer daha seçicidir (oktav hatasına karşı güvenli,
  /// zayıf seslerde "bulunamadı" çıkabilir). Tipik: 0.10–0.20.
  final double threshold;

  /// Eşiği geçen vadi yoksa aralıktaki global minimum bu değerin altındaysa
  /// kabul edilir.
  final double fallbackThreshold;

  /// Fark fonksiyonunda toplanan örnek sayısı. Büyük değer daha kararlı ama
  /// maliyet ≈ pencere × tauMax.
  final int maxIntegrationWindow;

  YinDetector({
    required this.sampleRate,
    required this.minFrequency,
    required this.maxFrequency,
    this.threshold = 0.15,
    this.fallbackThreshold = 0.35,
    this.maxIntegrationWindow = 2048,
  }) : assert(minFrequency > 0 && minFrequency < maxFrequency);

  late final int _tauMin = max(2, (sampleRate / maxFrequency).floor());
  late final int _tauMax = (sampleRate / minFrequency).ceil();
  late final Float64List _cmnd = Float64List(_tauMax + 2);

  /// Bir çerçevenin sahip olması gereken asgari uzunluk.
  int get minFrameLength => 2 * _tauMax + 2;

  YinResult detect(Float64List x) {
    final n = x.length;
    final w = min(maxIntegrationWindow, n - _tauMax - 1);

    if (w < _tauMax) {
      throw ArgumentError(
        'Çerçeve çok kısa: $n örnek var, en az $minFrameLength gerekli '
        '(minFrequency=$minFrequency Hz, sampleRate=$sampleRate).',
      );
    }

    // 1-2) Fark fonksiyonu + kümülatif ortalama normalizasyonu. Parabolik
    //      interpolasyon komşu değere baktığı için tauMax + 1'e kadar gider.
    final cmnd = _cmnd;
    cmnd[0] = 1.0;
    var running = 0.0;

    for (var lag = 1; lag <= _tauMax + 1; lag++) {
      var sum = 0.0;
      for (var j = 0; j < w; j++) {
        final d = x[j] - x[j + lag];
        sum += d * d;
      }
      running += sum;
      cmnd[lag] = running == 0 ? 1.0 : sum * lag / running;
    }

    // 3) Mutlak eşik: eşiğin altına inen ilk vadiyi bul, dibine kadar in.
    var tauEstimate = -1;
    var tau = _tauMin;

    while (tau <= _tauMax) {
      if (cmnd[tau] < threshold) {
        while (tau + 1 <= _tauMax && cmnd[tau + 1] < cmnd[tau]) {
          tau++;
        }
        tauEstimate = tau;
        break;
      }
      tau++;
    }

    // Eşiği geçen yoksa aralıktaki global minimuma bak.
    if (tauEstimate == -1) {
      var best = _tauMin;
      for (var t = _tauMin + 1; t <= _tauMax; t++) {
        if (cmnd[t] < cmnd[best]) best = t;
      }
      if (cmnd[best] > fallbackThreshold) return YinResult.unvoiced;
      tauEstimate = best;
    }

    // 4) Parabolik interpolasyon: örnek altı hassasiyet (sent doğruluğu için şart).
    final a = cmnd[tauEstimate - 1];
    final b = cmnd[tauEstimate];
    final c = cmnd[tauEstimate + 1];
    final denominator = a - 2 * b + c;
    final shift = denominator.abs() < 1e-12 ? 0.0 : 0.5 * (a - c) / denominator;
    final refinedTau = tauEstimate + shift.clamp(-1.0, 1.0);

    return YinResult(sampleRate / refinedTau, (1.0 - b).clamp(0.0, 1.0));
  }
}
