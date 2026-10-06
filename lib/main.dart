import 'package:studio_accordo_app_mobile/core/storage/hive_initializer.dart';
import 'package:studio_accordo_app_mobile/core/state/language_store.dart';
import 'package:studio_accordo_app_mobile/core/state/theme_store.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';
import 'package:studio_accordo_app_mobile/app.dart';

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
