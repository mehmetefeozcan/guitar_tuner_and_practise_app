// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get library => 'Library';

  @override
  String get progress => 'Progress';

  @override
  String get profile => 'Profile';

  @override
  String get today => 'Today';

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
}
