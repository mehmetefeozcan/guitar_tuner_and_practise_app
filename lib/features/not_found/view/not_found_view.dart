// not_found_view.dart

import 'package:go_router/go_router.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/widgets/buttons/custom_elevated_button.dart';
import 'package:studio_accordo_app_mobile/core/widgets/buttons/custom_outlined_button.dart';
import 'package:studio_accordo_app_mobile/features/not_found/store/not_found_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';
import 'package:studio_accordo_app_mobile/core/theme/app_colors.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView({super.key});

  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView>
    with BaseViewMixin<NotFoundView> {
  NotFoundStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<NotFoundStore>();

    await _store!.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: context.screenPadding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.space4,
                  vertical: context.space2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkPaper,
                  borderRadius: BorderRadius.circular(context.radiusLg),
                ),
                child: SvgPicture.asset(AppAssets.icons.wholeRestMeasure),
              ),
              SizedBox(height: context.space7),
              Text(context.l10n.noNotes, style: context.displayLarge),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.space4),
                child: Text(
                  context.l10n.pageNotFound,
                  style: context.bodyMedium!.copyWith(
                    color: AppColors.darkInkMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  context.go(MainRoutes.home);
                },
                expand: true,
                child: Text(
                  context.l10n.backToToday,
                  style: context.bodyMedium!.copyWith(
                    color: AppColors.onAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: context.space3),
              CustomOutlinedButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(MainRoutes.home);
                  }
                },
                expand: true,
                child: Text(
                  context.l10n.backToPrevious,
                  style: context.bodyMedium!.copyWith(
                    color: AppColors.darkInk,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
