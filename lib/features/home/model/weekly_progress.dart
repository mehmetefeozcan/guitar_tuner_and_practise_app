/// Haftanın pratik özeti — süre, hedef ve geçen haftaya göre fark.
class WeeklyProgress {
  final int minutes;
  final int goalMinutes;

  /// Geçen haftaya göre fark; negatif olabilir.
  final int diffMinutes;

  /// Sürenin metronomla geçen kısmı, saat cinsinden.
  final double metronomeHours;

  const WeeklyProgress({
    required this.minutes,
    required this.goalMinutes,
    required this.diffMinutes,
    required this.metronomeHours,
  });

  int get hours => minutes ~/ 60;
  int get remainingMinutes => minutes % 60;

  int get goalHours => goalMinutes ~/ 60;

  /// `LinearIndicator`'ın beklediği 0-100 aralığı.
  double get progress {
    if (goalMinutes <= 0) return 0;

    return (minutes / goalMinutes * 100).clamp(0, 100);
  }
}
