import 'package:guitar_tuner_and_practise_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

Future<T?> showGlobalBottomSheet<T>(
  Widget child, {
  bool isScrollControlled = true,
  void Function()? onClosed,
  Color? backgroundColor,
  EdgeInsets? padding,
  double? minChildSize,
  double? maxChildSize,
  double? initialChildSize,
}) async {
  final context = AppConstants.navigatorKey.currentContext;

  if (context == null) return null;

  final theme = Theme.of(context);

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor ?? theme.cardColor,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    showDragHandle: true,
    enableDrag: true,
    useSafeArea: true,
    builder: (context) {
      final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
      final contentPadding =
          (padding ?? EdgeInsets.only(left: 18.0, right: 18.0)).copyWith(
            bottom: keyboardPadding > 0 ? keyboardPadding + 10 : 24.0,
          );

      if (minChildSize == null && maxChildSize == null) {
        return Padding(padding: contentPadding, child: child);
      }

      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize ?? minChildSize ?? 0.5,
        minChildSize: minChildSize ?? 0.25,
        maxChildSize: maxChildSize ?? 0.9,
        builder: (context, scrollController) {
          return Padding(
            padding: contentPadding,
            child: PrimaryScrollController(
              controller: scrollController,
              child: child,
            ),
          );
        },
      );
    },
  );
}
