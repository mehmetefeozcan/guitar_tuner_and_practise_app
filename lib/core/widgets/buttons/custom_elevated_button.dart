import 'package:flutter/material.dart';

import 'button_metrics.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final bool expand;
  final bool isLoading;
  final String? loadingLabel;
  final double? radius;
  final EdgeInsets? padding;
  final Color? color;
  final Color? foregroundColor;
  final Color? disabledColor;
  final Color? splashColor;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.size = AppButtonSize.md,
    this.expand = false,
    this.isLoading = false,
    this.loadingLabel,
    this.radius,
    this.padding,
    this.color,
    this.foregroundColor,
    this.disabledColor,
    this.splashColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final disabled = onPressed == null || isLoading;
    final shape = BorderRadius.circular(radius ?? 8);

    final label = isLoading && loadingLabel != null
        ? Text(loadingLabel!)
        : child;

    final button = FilledButton(
      onPressed: disabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color ?? scheme.primary,
        foregroundColor: foregroundColor ?? scheme.onPrimary,
        disabledBackgroundColor: disabledColor ?? scheme.surfaceContainerHigh,
        disabledForegroundColor: scheme.onSurfaceVariant,
        overlayColor: splashColor,
        minimumSize: Size(0, size.minHeight),
        padding: padding ?? size.padding,
        textStyle: size.textStyle,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: shape),
      ),
      child: icon == null
          ? label
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconTheme.merge(
                  data: const IconThemeData(size: 20),
                  child: icon!,
                ),
                const SizedBox(width: 8),
                label,
              ],
            ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
