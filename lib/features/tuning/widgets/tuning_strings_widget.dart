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
    final inTune = store.tunedStrings.contains(index);
    final green = context.ds.signalTrue;

    // Akortta: yeşil zemin. Metin rengi zeminin açıklığına göre seçilir
    // (koyu temada açık yeşil, açık temada koyu yeşil kullanılıyor).
    final onGreen = ThemeData.estimateBrightnessForColor(green) == Brightness.dark
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: () => store.selectString(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          vertical: context.space3,
          horizontal: context.space2,
        ),
        decoration: BoxDecoration(
          color: inTune
              ? green
              : selected
              ? context.colors.primary
              : context.colors.surfaceContainer,
          borderRadius: BorderRadius.circular(context.radiusSm),
          // Çalınan (seçili) tel akortlandıysa da ayırt edilsin: yeşil zeminde
          // birincil renk çerçeve.
          border: Border.all(
            width: selected ? 2 : 1,
            color: selected
                ? context.colors.primary
                : inTune
                ? green
                : context.colors.outlineVariant,
          ),
        ),
        child: Center(
          child: Text(
            note,
            style: context.bodyMedium!.copyWith(
              color: inTune
                  ? onGreen
                  : selected
                  ? context.colors.onPrimary
                  : context.colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
