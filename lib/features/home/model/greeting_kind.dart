import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';

import 'package:flutter/widgets.dart';

/// Günün selamı. Sınırlar sabah 5, öğlen 12, akşam 18.
enum GreetingKind {
  morning,
  afternoon,
  evening,
  night;

  static GreetingKind fromHour(int hour) {
    if (hour < 5) return GreetingKind.night;
    if (hour < 12) return GreetingKind.morning;
    if (hour < 18) return GreetingKind.afternoon;

    return GreetingKind.evening;
  }

  String label(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      GreetingKind.morning => l10n.goodMorning,
      GreetingKind.afternoon => l10n.goodAfternoon,
      GreetingKind.evening => l10n.goodEvening,
      GreetingKind.night => l10n.goodNight,
    };
  }
}
