import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/store/tuning_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Algılanan nota, oktavı ve ölçülen frekans. Ekrandaki tek büyük okuma.
class TunerNoteInfoWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final reading = store.reading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: reading?.note ?? '—',
                    style: context.displayLarge!.copyWith(
                      fontSize: 92.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: reading?.octave.toString() ?? "",
                    style: context.readout.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              reading == null
                  ? "— Hz"
                  : "${reading.frequency.toStringAsFixed(2)} Hz",
              style: context.numericS.copyWith(
                color: context.colors.onSurfaceVariant,
                fontSize: 15.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
