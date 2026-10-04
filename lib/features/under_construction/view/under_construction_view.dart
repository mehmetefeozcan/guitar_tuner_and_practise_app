// under_construction_view.dart

import 'package:guitar_tuner_and_practise_app/features/under_construction/store/under_construction_store.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/buttons/custom_elevated_button.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_view.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnderConstructionView extends StatefulWidget {
  final String title;
  const UnderConstructionView({super.key, required this.title});

  @override
  State<UnderConstructionView> createState() => _UnderConstructionViewState();
}

class _UnderConstructionViewState extends State<UnderConstructionView>
    with BaseViewMixin<UnderConstructionView> {
  UnderConstructionStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<UnderConstructionStore>();

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
                child: SvgPicture.asset(AppAssets.icons.wipMusicStaff),
              ),
              SizedBox(height: context.space7),
              Text(widget.title, style: context.displayLarge),
              SizedBox(height: context.space3),
              buildStatusPill(context),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatusPill(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.space1,
        horizontal: context.space2,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkAccentWash,
        borderRadius: BorderRadius.circular(context.radiusPill),
        border: Border.all(width: 1, color: AppColors.darkAccentDim),
      ),
      child: Text(
        context.l10n.disabledInThisVersion,
        style: context.titleSmall!.copyWith(
          color: AppColors.darkAccentText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
