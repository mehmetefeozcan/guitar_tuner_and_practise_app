import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @goalPractiseHour.
  ///
  /// In en, this message translates to:
  /// **'goal {hour} h'**
  String goalPractiseHour(Object hour);

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @splashMessage1.
  ///
  /// In en, this message translates to:
  /// **'The library is being prepared'**
  String get splashMessage1;

  /// No description provided for @splashMessage2.
  ///
  /// In en, this message translates to:
  /// **'The tuning reference is being set'**
  String get splashMessage2;

  /// No description provided for @splashMessage3.
  ///
  /// In en, this message translates to:
  /// **'Your work history is being reviewed'**
  String get splashMessage3;

  /// No description provided for @splashMessage4.
  ///
  /// In en, this message translates to:
  /// **'The notes are being transcribed'**
  String get splashMessage4;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get min;

  /// No description provided for @h.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get h;

  /// No description provided for @comparedToLastWeek.
  ///
  /// In en, this message translates to:
  /// **'Compared to last week'**
  String get comparedToLastWeek;

  /// No description provided for @theClockWithMetronome.
  ///
  /// In en, this message translates to:
  /// **'the clock with a metronome'**
  String get theClockWithMetronome;

  /// No description provided for @tuning.
  ///
  /// In en, this message translates to:
  /// **'Tuning'**
  String get tuning;

  /// No description provided for @metronome.
  ///
  /// In en, this message translates to:
  /// **'Metronome'**
  String get metronome;

  /// No description provided for @noteScan.
  ///
  /// In en, this message translates to:
  /// **'Note Scan'**
  String get noteScan;

  /// No description provided for @homework.
  ///
  /// In en, this message translates to:
  /// **'Homework'**
  String get homework;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @bars.
  ///
  /// In en, this message translates to:
  /// **'Bars'**
  String get bars;

  /// No description provided for @targetBPM.
  ///
  /// In en, this message translates to:
  /// **'target {BPM} BPM'**
  String targetBPM(Object BPM);

  /// No description provided for @working.
  ///
  /// In en, this message translates to:
  /// **'Working'**
  String get working;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @lastPracticed.
  ///
  /// In en, this message translates to:
  /// **'Last practiced'**
  String get lastPracticed;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @dayAgo.
  ///
  /// In en, this message translates to:
  /// **'{day} day ago'**
  String dayAgo(Object day);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{day} days ago'**
  String daysAgo(Object day);

  /// No description provided for @weekAgo.
  ///
  /// In en, this message translates to:
  /// **'{week} week ago'**
  String weekAgo(Object week);

  /// No description provided for @weeksAgo.
  ///
  /// In en, this message translates to:
  /// **'{week} weeks ago'**
  String weeksAgo(Object week);

  /// No description provided for @monthAgo.
  ///
  /// In en, this message translates to:
  /// **'{month} month ago'**
  String monthAgo(Object month);

  /// No description provided for @monthsAgo.
  ///
  /// In en, this message translates to:
  /// **'{month} months ago'**
  String monthsAgo(Object month);

  /// No description provided for @yearAgo.
  ///
  /// In en, this message translates to:
  /// **'{year} year ago'**
  String yearAgo(Object year);

  /// No description provided for @yearsAgo.
  ///
  /// In en, this message translates to:
  /// **'{year} years ago'**
  String yearsAgo(Object year);

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'accuracy'**
  String get accuracy;

  /// No description provided for @noNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes here'**
  String get noNotes;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for has been moved or never existed. If the URL is correct, let us know.'**
  String get pageNotFound;

  /// No description provided for @backToToday.
  ///
  /// In en, this message translates to:
  /// **'Back to Today'**
  String get backToToday;

  /// No description provided for @backToPrevious.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get backToPrevious;

  /// No description provided for @disabledInThisVersion.
  ///
  /// In en, this message translates to:
  /// **'Disabled in this version'**
  String get disabledInThisVersion;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
