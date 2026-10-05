import 'package:guitar_tuner_and_practise_app/features/home/widgets/home_shortcut_button_widget.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';

import 'package:flutter/material.dart';

/// Araç kısayolları satırı — akort, metronom, nota tarama.
class HomeShortcutsWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final shortcuts = [
      ShortCutParams(
        path: MainRoutes.tuning,
        icon: AppAssets.icons.tuner,
        text: context.l10n.tuning,
      ),
      ShortCutParams(
        path: MainRoutes.metronome,
        icon: AppAssets.icons.metronome,
        text: context.l10n.metronome,
      ),
      ShortCutParams(
        path: MainRoutes.noteScan,
        icon: AppAssets.icons.scan,
        text: context.l10n.noteScan,
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: context.space3,
      children: shortcuts
          .map(
            (params) =>
                Expanded(child: HomeShortcutButtonWidget(params: params)),
          )
          .toList(),
    );
  }
}
