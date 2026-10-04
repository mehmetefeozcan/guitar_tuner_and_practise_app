// splash_view.dart

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/features/splash/store/splash_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/indicator/index.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_view.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

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

    addReaction(
      reaction((_) => _store!.navigateToHome, (bool navigate) {
        if (navigate) {
          context.go(MainRoutes.home);
        }
      }),
    );

    await _store!.initApp();
  }

  String handleMessage(BuildContext context) {
    switch (_store!.selectedMessageOrder) {
      case 1:
        return context.l10n.splashMessage1;
      case 2:
        return context.l10n.splashMessage2;
      case 3:
        return context.l10n.splashMessage3;
      case 4:
        return context.l10n.splashMessage4;
      default:
        return context.l10n.splashMessage1;
    }
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
                child: Observer(
                  builder: (_) => TweenAnimationBuilder<double>(
                    tween: Tween(end: _store!.progress),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    builder: (context, value, _) =>
                        LinearIndicator(progress: value),
                  ),
                ),
              ),
              SizedBox(height: context.space4),
              Observer(
                builder: (context) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Text(
                    handleMessage(context),
                    key: ValueKey(_store!.selectedMessageOrder),
                    style: context.titleSmall!.copyWith(
                      color: AppColors.darkInkSubtle,
                    ),
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
