// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String goalPractiseHour(Object hour) {
    return 'goal $hour h';
  }

  @override
  String get library => 'Library';

  @override
  String get progress => 'Progress';

  @override
  String get profile => 'Profile';

  @override
  String get thisWeek => 'This Week';

  @override
  String get welcome => 'Welcome';

  @override
  String get splashMessage1 => 'The library is being prepared';

  @override
  String get splashMessage2 => 'The tuning reference is being set';

  @override
  String get splashMessage3 => 'Your work history is being reviewed';

  @override
  String get splashMessage4 => 'The notes are being transcribed';

  @override
  String get min => 'min';

  @override
  String get h => 'h';

  @override
  String get comparedToLastWeek => 'Compared to last week';

  @override
  String get theClockWithMetronome => 'the clock with a metronome';

  @override
  String get tuning => 'Tuning';

  @override
  String get metronome => 'Metronome';

  @override
  String get noteScan => 'Note Scan';

  @override
  String get homework => 'Homework';

  @override
  String get all => 'All';

  @override
  String get bars => 'Bars';

  @override
  String targetBPM(Object BPM) {
    return 'target $BPM BPM';
  }

  @override
  String get working => 'Working';

  @override
  String get delivery => 'Delivery';

  @override
  String get lastPracticed => 'Last practiced';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String dayAgo(Object day) {
    return '$day day ago';
  }

  @override
  String daysAgo(Object day) {
    return '$day days ago';
  }

  @override
  String weekAgo(Object week) {
    return '$week week ago';
  }

  @override
  String weeksAgo(Object week) {
    return '$week weeks ago';
  }

  @override
  String monthAgo(Object month) {
    return '$month month ago';
  }

  @override
  String monthsAgo(Object month) {
    return '$month months ago';
  }

  @override
  String yearAgo(Object year) {
    return '$year year ago';
  }

  @override
  String yearsAgo(Object year) {
    return '$year years ago';
  }

  @override
  String get accuracy => 'accuracy';

  @override
  String get noNotes => 'No notes here';

  @override
  String get pageNotFound =>
      'The page you\'re looking for has been moved or never existed. If the URL is correct, let us know.';

  @override
  String get backToToday => 'Back to Today';

  @override
  String get backToPrevious => 'Go back';

  @override
  String get disabledInThisVersion => 'Disabled in this version';
}
