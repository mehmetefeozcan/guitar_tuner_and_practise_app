import 'package:go_router/go_router.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeShortcutButtonWidget extends StatelessWidget {
  final ShortCutParams params;
  const new({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.push(params.path),
        child: Container(
          width: context.width,
          padding: EdgeInsets.symmetric(
            vertical: context.space4,
            horizontal: context.space3,
          ),
          decoration: BoxDecoration(
            color: AppColors.darkSurface200,
            borderRadius: BorderRadius.circular(context.radiusMd),
            border: Border.all(width: 1, color: AppColors.darkBorder),
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
      ),
    );
  }
}

class ShortCutParams {
  final String path;
  final String icon;
  final String text;

  ShortCutParams({required this.path, required this.icon, required this.text});
}
