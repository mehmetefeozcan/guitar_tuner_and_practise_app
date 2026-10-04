import 'package:guitar_tuner_and_practise_app/core/theme/app_semantic_colors.dart';
import 'package:flutter/material.dart';

import 'button_metrics.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final AppButtonTone tone;
  final bool expand;
  final double? radius;
  final EdgeInsets? padding;
  final Color? color;
  final double? borderWidth;
  final Color? splashColor;
  final Widget? icon;

  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.size = AppButtonSize.md,
    this.tone = AppButtonTone.normal,
    this.expand = false,
    this.radius,
    this.padding,
    this.color,
    this.borderWidth,
    this.splashColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final ds = theme.extension<AppSemanticColors>();

    final danger = tone == AppButtonTone.danger;
    final signalOff = ds?.signalOff ?? scheme.error;

    final strokeColor = color ?? (danger ? signalOff : scheme.outline);
    final labelColor = color ?? (danger ? signalOff : scheme.onSurface);

    final button = OutlinedButton(
      onPressed: onPressed,
      style:
          OutlinedButton.styleFrom(
            foregroundColor: labelColor,
            disabledForegroundColor: scheme.onSurfaceVariant,
            overlayColor: splashColor,
            side: BorderSide(color: strokeColor, width: borderWidth ?? 1),
            minimumSize: Size(0, size.minHeight),
            padding: padding ?? size.padding,
            textStyle: size.textStyle,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith((states) {
              final c = states.contains(WidgetState.disabled)
                  ? scheme.outlineVariant
                  : strokeColor;
              return BorderSide(color: c, width: borderWidth ?? 1);
            }),
          ),
      child: icon == null
          ? child
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconTheme.merge(
                  data: const IconThemeData(size: 20),
                  child: icon!,
                ),
                const SizedBox(width: 8),
                child,
              ],
            ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
