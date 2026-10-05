/// Üzerinde çalışılan ödev: eser, ölçü aralığı, tempo hedefi ve teslim günü.
class HomeworkItem {
  final String pieceName;
  final int? minBar;
  final int? maxBar;

  /// Hedef tempo.
  final int? bpm;

  /// En son hangi tempoda çalışıldıysa o.
  final int? lastWorkingBpm;

  final DateTime? delivery;

  /// Tamamlanma yüzdesi, 0-100.
  final double progress;

  const HomeworkItem({
    required this.pieceName,
    this.minBar,
    this.maxBar,
    this.bpm,
    this.lastWorkingBpm,
    this.delivery,
    this.progress = 0,
  });

  bool get hasBarRange => minBar != null && maxBar != null;
}
