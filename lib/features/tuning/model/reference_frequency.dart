/// A4'ün referans frekansı — akort hedefinin nerede durduğunu belirler.
///
/// Ölçülen frekans bundan etkilenmez; değişen şey hedefin yeri.
abstract final class ReferenceFrequency {
  /// Modern standart.
  static const standard = 440.0;

  /// Alt sayfada rozet olarak sunulanlar: barok (415), Verdi (432),
  /// standart (440) ve orkestraların kullandığı iki üst değer.
  static const presets = [415.0, 432.0, 440.0, 442.0, 443.0];

  static const min = 400.0;
  static const max = 480.0;
}
