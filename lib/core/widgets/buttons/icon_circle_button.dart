import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Daire zeminli ikon butonu — referans frekansı ve metronom BPM'inin
/// `−` / `+` adımları.
///
/// İkon bir SVG asset yolu (`AppAssets.icons.*`) olarak verilir.
class IconCircleButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;

  const IconCircleButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colors.surfaceContainerHigh,
        ),
        padding: EdgeInsets.all(context.space4),
        child: Center(
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              context.colors.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
