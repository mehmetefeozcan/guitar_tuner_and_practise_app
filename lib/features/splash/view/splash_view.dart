// splash_view.dart

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/indicator/index.dart';
import 'package:guitar_tuner_and_practise_app/features/splash/store/splash_store.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_view.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with BaseViewMixin<SplashView> {
  SplashStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<SplashStore>();

    await _store!.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: context.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset(AppAssets.icons.porte),
              SizedBox(height: context.space7),
              Text("Diyapazon", style: context.displayLarge),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 96.w),
                child: LinearIndicator(progress: 10),
              ),
              SizedBox(height: context.space4),
              Text(
                context.l10n.splashMessage1,
                style: context.titleSmall!.copyWith(
                  color: AppColors.darkInkSubtle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
