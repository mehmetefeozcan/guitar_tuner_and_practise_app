import 'package:guitar_tuner_and_practise_app/core/storage/hive_initializer.dart';
import 'package:guitar_tuner_and_practise_app/core/state/language_store.dart';
import 'package:guitar_tuner_and_practise_app/core/state/theme_store.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';
import 'package:guitar_tuner_and_practise_app/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  // System Configuration
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    ),
  );
  // DI Configuration
  await HiveInitializer.init();
  await configureDependencies();
  // Initialize Theme & Language
  await getIt<ThemeStore>().loadTheme();
  await getIt<LanguageStore>().loadLanguage();

  runApp(const MyApp());
}
