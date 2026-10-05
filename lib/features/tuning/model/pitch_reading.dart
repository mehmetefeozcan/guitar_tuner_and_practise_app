/// Mikrofondan gelen tek bir perde ölçümü.
///
/// [cents] işaretlidir: negatif pes, pozitif tiz. Renk ve yön kararları
/// buradan türetilir, ölçümün kendisi hiçbir yerde yuvarlanmadan saklanır.
class PitchReading {
  final String note;
  final int octave;
  final double frequency;
  final double cents;

  const PitchReading({
    required this.note,
    required this.octave,
    required this.frequency,
    required this.cents,
  });
}
