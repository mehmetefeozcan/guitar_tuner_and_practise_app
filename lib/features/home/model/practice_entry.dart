/// Tamamlanmış bir pratik kaydı — "kaldığın yer" satırının verisi.
class PracticeEntry {
  final String pieceName;
  final DateTime date;

  /// Yüzde cinsinden doğruluk.
  final int accuracy;

  const PracticeEntry({
    required this.pieceName,
    required this.date,
    required this.accuracy,
  });
}
