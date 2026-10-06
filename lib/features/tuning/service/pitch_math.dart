import 'package:studio_accordo_app_mobile/features/tuning/model/pitch_reading.dart';

import 'dart:typed_data';
import 'dart:math';

/// Frekans ↔ nota dönüşümleri. Saf matematik; durum tutmaz.
abstract final class PitchMath {
  /// Bemol yazımı: `TuningType` telleri de (Eb2, Db3…) bemolle yazılıyor.
  static const _noteNames = [
    'C',
    'Db',
    'D',
    'Eb',
    'E',
    'F',
    'Gb',
    'G',
    'Ab',
    'A',
    'Bb',
    'B',
  ];

  static final _noteName = RegExp(r'^([A-G])([b#]?)(-?\d+)$');

  static const _semitones = {
    'C': 0,
    'D': 2,
    'E': 4,
    'F': 5,
    'G': 7,
    'A': 9,
    'B': 11,
  };

  /// `'Eb2'` → (`'Eb'`, `2`). Tanınmayan biçimde [FormatException] fırlatır.
  static (String note, int octave) splitNote(String name) {
    final m = _noteName.firstMatch(name);
    if (m == null) throw FormatException('Geçersiz nota adı', name);

    return ('${m[1]}${m[2]}', int.parse(m[3]!));
  }

  /// `'A4'`, `'Eb2'` gibi bir notanın [referenceHz] (A4) ızgarasındaki
  /// frekansı. Akort düzenindeki tel notalarını hedef frekansa çevirir.
  static double noteToHz(String name, double referenceHz) {
    final (note, octave) = splitNote(name);
    final accidental = note.length > 1 ? (note[1] == '#' ? 1 : -1) : 0;
    final midi = (octave + 1) * 12 + _semitones[note[0]]! + accidental;

    return referenceHz * pow(2, (midi - 69) / 12);
  }

  /// [hz]'in [targetHz]'e göre sapması, sent cinsinden. Negatif = pes.
  static double cents(double hz, double targetHz) =>
      1200 * log(hz / targetHz) / ln2;

  /// Ölçülen frekansı, [referenceHz] (A4) ızgarasındaki en yakın notaya
  /// bağlar. Sapma her zaman ±50 sent içinde kalır — akort cetveliyle aynı
  /// skala.
  static PitchReading reading(double hz, double referenceHz) {
    // MIDI numarası: A4 = 69.
    final midi = 69 + 12 * log(hz / referenceHz) / ln2;
    final nearest = midi.round();
    final targetHz = referenceHz * pow(2, (nearest - 69) / 12);

    return PitchReading(
      note: _noteNames[nearest % 12],
      octave: nearest ~/ 12 - 1,
      frequency: hz,
      cents: cents(hz, targetHz),
    );
  }

  /// Çerçevenin RMS düzeyi (0..1). Sessizlik eşiği için.
  static double rms(Float64List samples) {
    var sum = 0.0;
    for (final s in samples) {
      sum += s * s;
    }

    return sqrt(sum / samples.length);
  }
}
