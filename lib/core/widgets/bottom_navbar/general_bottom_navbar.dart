import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralBottomNavbar extends StatelessWidget {
  final String currentPath;

  const GeneralBottomNavbar({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IntrinsicHeight(
          child: Container(
            width: context.width,
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 10.h,
              bottom: context.isAndroid ? 50.h : 30.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkSurface200,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.radiusLarge),
              ),
            ),
            child: Row(
              children: [
                buildNavItem(
                  context,
                  AppAssets.icons.calendar,
                  context.l10n.today,
                  MainRoutes.home,
                ),
                buildNavItem(
                  context,
                  AppAssets.icons.book,
                  context.l10n.library,
                  MainRoutes.library,
                ),
                buildNavItem(
                  context,
                  AppAssets.icons.progress,
                  context.l10n.progress,
                  MainRoutes.progress,
                ),
                buildNavItem(
                  context,
                  AppAssets.icons.profile,
                  context.l10n.profile,
                  MainRoutes.profile,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNavItem(
    BuildContext context,
    String icon,
    String title,
    String route,
  ) {
    final color = currentPath == route
        ? AppColors.darkAccentText
        : AppColors.darkInkSubtle;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.go(route),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2.h,
        children: [
          SvgPicture.asset(
            icon,
            width: 22.w,
            height: 22.h,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            fit: BoxFit.scaleDown,
          ),
          Text(
            title,
            style: context.bodySmall!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
