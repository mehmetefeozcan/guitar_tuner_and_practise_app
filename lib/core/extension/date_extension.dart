import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';

import 'package:moment_dart/moment_dart.dart';
import 'package:flutter/widgets.dart';

/// Göreli tarih metni — "Bugün", "3 gün önce", "2 ay önce".
///
/// Gün farkı üzerinden çalışır, saat farkı üzerinden değil: dün 23:00 ile
/// bugün 01:00 arası "Dün" der, "2 saat önce" demez. Pratik geçmişi gün
/// bazında tutulduğu için doğru olan bu.
extension RelativeDate on DateTime {
  String relative(BuildContext context) {
    final l10n = context.l10n;
    final now = Moment.now();

    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(year, month, day);

    final diffDays = today.difference(target).inDays;

    if (diffDays <= 0) {
      return l10n.today;
    }

    if (diffDays == 1) {
      return l10n.yesterday;
    }

    if (diffDays < 7) {
      return l10n.daysAgo(diffDays);
    }

    if (diffDays < 30) {
      final weeks = diffDays ~/ 7;
      return weeks == 1 ? l10n.weekAgo(weeks) : l10n.weeksAgo(weeks);
    }

    if (diffDays < 365) {
      final months = diffDays ~/ 30;
      return months == 1 ? l10n.monthAgo(months) : l10n.monthsAgo(months);
    }

    final years = diffDays ~/ 365;
    return years == 1 ? l10n.yearAgo(years) : l10n.yearsAgo(years);
  }
}
