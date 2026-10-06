import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';
import 'package:studio_accordo_app_mobile/core/theme/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SubPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? backRoute;
  final List<Widget>? actions;
  final bool centerTitle;

  const SubPageAppbar({
    super.key,
    required this.title,
    this.backRoute,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: context.displayMedium!.copyWith(color: AppColors.darkInk),
      ),
      actions: actions,
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.backOrGo(backRoute, replace: true),
        child: Transform.flip(
          flipX: true,
          child: SvgPicture.asset(
            AppAssets.icons.chevron,
            width: 44.w,
            height: 44.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
