import 'package:guitar_tuner_and_practise_app/core/storage/hive_service.dart';
import 'package:guitar_tuner_and_practise_app/core/l10n/supported_locales.dart';

import 'package:injectable/injectable.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:mobx/mobx.dart';

import 'dart:ui';

part 'language_store.g.dart';

@singleton
class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  final HiveService settingsStorage;

  _LanguageStore(this.settingsStorage);

  static const _key = 'languageCode';
  static const _defaultLocale = Locale('tr');

  @observable
  Locale locale = _defaultLocale;

  @action
  Future<void> loadLanguage() async {
    final saved = settingsStorage.get<String>(_key);
    if (saved != null) {
      locale = Locale(saved);
      _applyMomentLocalization(locale);
      return;
    }

    final deviceLanguageCode = PlatformDispatcher.instance.locale.languageCode;
    final isDeviceLocaleSupported = AppLocales.supportedLocales.any(
      (supported) => supported.languageCode == deviceLanguageCode,
    );

    locale = isDeviceLocaleSupported
        ? Locale(deviceLanguageCode)
        : _defaultLocale;

    _applyMomentLocalization(locale);
  }

  @action
  Future<void> setLanguage(Locale newLocale) async {
    locale = newLocale;
    await settingsStorage.set(_key, newLocale.languageCode);
    _applyMomentLocalization(locale);
  }

  void _applyMomentLocalization(Locale locale) {
    final momentLocalization =
        MomentLocalizations.byLanguage(locale.languageCode) ??
        MomentLocalizations.enUS();
    Moment.setGlobalLocalization(momentLocalization);
  }
}
