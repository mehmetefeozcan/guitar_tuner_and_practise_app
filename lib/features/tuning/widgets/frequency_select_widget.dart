import 'package:guitar_tuner_and_practise_app/features/tuning/widgets/frequency_select_sheet.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/store/tuning_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/utils/show_bottom_sheet.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Appbar'daki referans frekansı rozeti — dokununca ayar sayfasını açar.
class FrequencySelectWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showGlobalBottomSheet<void>(
          FrequencySelectSheet(store: store),
          padding: context.screenPadding,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.space2,
          horizontal: context.space3,
        ),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainer,
          borderRadius: BorderRadius.circular(context.radiusPill),
          border: Border.all(width: 1, color: context.colors.outlineVariant),
        ),
        child: Observer(
          builder: (context) => Text(
            "A4 ${store.referenceHz.toStringAsFixed(0)} Hz",
            style: context.numericS.copyWith(
              color: context.colors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
