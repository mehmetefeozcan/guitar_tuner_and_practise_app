// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String goalPractiseHour(Object hour) {
    return 'hedef $hour sa';
  }

  @override
  String get library => 'Kütüphane';

  @override
  String get progress => 'İlerleme';

  @override
  String get profile => 'Profil';

  @override
  String get thisWeek => 'Bu Hafta';

  @override
  String get welcome => 'Hoşgeldiniz';

  @override
  String get splashMessage1 => 'Kütüphane hazırlanıyor';

  @override
  String get splashMessage2 => 'Akort referansı ayarlanıyor';

  @override
  String get splashMessage3 => 'Çalışma geçmişin okunuyor';

  @override
  String get splashMessage4 => 'Notalar çözümleniyor';

  @override
  String get min => 'dk';

  @override
  String get h => 'sa';

  @override
  String get comparedToLastWeek => 'Geçen haftaya göre';

  @override
  String get theClockWithMetronome => 'saati metronomla';

  @override
  String get tuning => 'Akort';

  @override
  String get metronome => 'Metronom';

  @override
  String get noteScan => 'Nota tara';

  @override
  String get homework => 'Ödevin';

  @override
  String get all => 'Tümü';

  @override
  String get bars => 'Ölçü';

  @override
  String targetBPM(Object BPM) {
    return 'hedef $BPM BPM';
  }

  @override
  String get working => 'Çalışılıyor';

  @override
  String get delivery => 'Teslim';

  @override
  String get lastPracticed => 'Kaldığın yer';

  @override
  String get today => 'Bugün';

  @override
  String get yesterday => 'Dün';

  @override
  String dayAgo(Object day) {
    return '$day gün önce';
  }

  @override
  String daysAgo(Object day) {
    return '$day gün önce';
  }

  @override
  String weekAgo(Object week) {
    return '$week hafta önce';
  }

  @override
  String weeksAgo(Object week) {
    return '$week hafta önce';
  }

  @override
  String monthAgo(Object month) {
    return '$month ay önce';
  }

  @override
  String monthsAgo(Object month) {
    return '$month ay önce';
  }

  @override
  String yearAgo(Object year) {
    return '$year yıl önce';
  }

  @override
  String yearsAgo(Object year) {
    return '$year yıl önce';
  }

  @override
  String get accuracy => 'doğruluk';

  @override
  String get noNotes => 'Burada nota yok';

  @override
  String get pageNotFound =>
      'Aradığın ekran taşınmış ya da hiç var olmamış. Adres doğruysa bize bildir.';

  @override
  String get backToToday => 'Bugün\'e dön';

  @override
  String get backToPrevious => 'Önceki ekrana dön';

  @override
  String get disabledInThisVersion => 'Bu sürümde kapalı';

  @override
  String get referenceFrequency => 'Referans frekansı';

  @override
  String get defaultValue => 'Varsayılan';

  @override
  String get frequentlyUsed => 'Sık Kullanılanlar';

  @override
  String get frequentlyUsedDesc =>
      'Ölçülen frekans değişmez; değişen şey hedefin nerede olduğu. 440 dışında bir değer seçtiğinde akort ekranı bunu üstte gösterir.';

  @override
  String get done => 'Bitti';
}
