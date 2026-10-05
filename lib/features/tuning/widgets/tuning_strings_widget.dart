import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/store/tuning_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Seçili akort düzeninin telleri — kalından inceye, dokununca seçilir.
class TuningStringsWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.space2,
      children: [
        Text(
          context.l10n.strings.toUpperCase(),
          style: context.titleSmall!.copyWith(color: context.ds.inkSubtle),
        ),
        Observer(
          builder: (context) {
            final strings = store.strings;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: context.space2,
              children: List.generate(
                strings.length,
                (index) => Expanded(
                  child: buildString(context, strings[index], index),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildString(BuildContext context, String note, int index) {
    final selected = index == store.selectedStringIndex;

    return GestureDetector(
      onTap: () => store.selectString(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.space3,
          horizontal: context.space2,
        ),
        decoration: BoxDecoration(
          color: selected
              ? context.colors.primary
              : context.colors.surfaceContainer,
          borderRadius: BorderRadius.circular(context.radiusSm),
          border: Border.all(width: 1, color: context.colors.outlineVariant),
        ),
        child: Center(
          child: Text(
            note,
            style: context.bodyMedium!.copyWith(
              color: selected
                  ? context.colors.onPrimary
                  : context.colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
