import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/// Akort cetveli: ortada tolerans bandı, kenarlarda ±50 sentlik uç çizgiler
/// ve sapmayı gösteren ibre.
///
/// Skala ±[scaleCents] ile sınırlı; bunun dışındaki sapmalarda ibre uçta
/// durur, cetvelden taşmaz.
class TunerReadoutWidget extends StatelessWidget {
  /// İşaretli sapma — negatif pes, pozitif tiz. Ölçüm yoksa `null`,
  /// ibre merkezde kalır.
  final double? cents;

  /// Toleransın içinde miyiz — ibrenin rengini bu belirler.
  final bool inTune;

  const new({super.key, required this.cents, required this.inTune});

  /// Cetvelin bir ucunun karşılığı.
  static const scaleCents = 50.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final minorTickInset = 45.w;

        return SizedBox(
          width: width,
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: buildMajorTick(context),
              ),
              Positioned(
                left: minorTickInset,
                child: buildMinorTickGroup(context),
              ),
              buildTolorenceBand(context, width),
              Positioned(
                right: minorTickInset,
                child: buildMinorTickGroup(context),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: buildMajorTick(context),
              ),
              buildNeedle(context, width),
            ],
          ),
        );
      },
    );
  }

  Widget buildTolorenceBand(BuildContext context, double width) {
    return Container(
      width: width * 0.13,
      height: 24.w,
      decoration: BoxDecoration(
        color: context.ds.accentWash,
        border: Border.all(color: context.ds.accentDim),
        borderRadius: BorderRadius.circular(context.radiusXs),
      ),
    );
  }

  Widget buildMajorTick(BuildContext context) {
    return Container(
      width: 1.w,
      height: 18.w,
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.outline),
      ),
    );
  }

  Widget buildMinorTick(BuildContext context) {
    return Container(
      width: 1.w,
      height: 10.w,
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.outlineVariant),
      ),
    );
  }

  Widget buildMinorTickGroup(BuildContext context) {
    double spacing = 44.w;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: List.generate(3, (index) => buildMinorTick(context)),
    );
  }

  Widget buildNeedle(BuildContext context, double width) {
    final needleWidth = 4.w;

    // Merkezden sapma: skalanın yarısı cetvelin yarısına karşılık gelir.
    final travel = (width - needleWidth) / 2;
    final ratio = ((cents ?? 0) / scaleCents).clamp(-1.0, 1.0);

    // Ölçümler eşit aralıklı gelmez (algılayıcı meşgulse çerçeve atlanır);
    // ibre her yeni değerde zıplamasın diye konuma yumuşakça gider.
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(end: ratio * travel),
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOutCubic,
      builder: (context, dx, child) =>
          Transform.translate(offset: Offset(dx, 4.w), child: child),
      child: Container(
        width: needleWidth,
        height: 42.w,
        decoration: BoxDecoration(
          color: inTune ? context.ds.signalTrue : context.ds.signalOff,
          borderRadius: context.borderRadiusPill,
        ),
      ),
    );
  }
}
