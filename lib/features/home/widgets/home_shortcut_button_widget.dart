import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Tek kısayol kutusu. Genişliği kullanan taraf belirler — satır içinde
/// `Expanded` ile sarılır (bkz. `HomeShortcutsWidget`).
class HomeShortcutButtonWidget extends StatelessWidget {
  final ShortCutParams params;

  const new({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(params.path),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.space4,
          horizontal: context.space3,
        ),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainer,
          borderRadius: BorderRadius.circular(context.radiusMd),
          border: Border.all(width: 1, color: context.colors.outlineVariant),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: context.space2,
            children: [
              SvgPicture.asset(params.icon),
              Text(params.text, style: context.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class ShortCutParams {
  final String path;
  final String icon;
  final String text;

  const ShortCutParams({
    required this.path,
    required this.icon,
    required this.text,
  });
}
