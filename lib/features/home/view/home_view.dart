// home_view.dart

import 'package:guitar_tuner_and_practise_app/features/home/widgets/home_last_practiced_widget.dart';
import 'package:guitar_tuner_and_practise_app/features/home/widgets/home_shortcut_button_widget.dart';
import 'package:guitar_tuner_and_practise_app/features/home/widgets/home_weekly_progress_widget.dart';
import 'package:guitar_tuner_and_practise_app/features/home/widgets/home_lesson_widget.dart';
import 'package:guitar_tuner_and_practise_app/features/home/widgets/home_appbar_widget.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/features/home/store/home_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_view.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseViewMixin<HomeView> {
  HomeStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<HomeStore>();

    await _store!.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: context.screenPadding,
          physics: BouncingScrollPhysics(),
          child: Column(
            spacing: context.space5,
            children: [
              const HomeAppbarWidget(),
              HomeWeeklyProgressWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: context.space3,
                children: [
                  HomeShortcutButtonWidget(
                    params: ShortCutParams(
                      path: MainRoutes.tuning,
                      icon: AppAssets.icons.tuner,
                      text: context.l10n.tuning,
                    ),
                  ),
                  HomeShortcutButtonWidget(
                    params: ShortCutParams(
                      path: MainRoutes.metronome,
                      icon: AppAssets.icons.metronome,
                      text: context.l10n.metronome,
                    ),
                  ),
                  HomeShortcutButtonWidget(
                    params: ShortCutParams(
                      path: MainRoutes.noteScan,
                      icon: AppAssets.icons.scan,
                      text: context.l10n.noteScan,
                    ),
                  ),
                ],
              ),
              HomeLessonWidget(
                pieceName: "Carcassi Op. 60 No. 3",
                minBar: 1,
                maxBar: 16,
                bpm: 96,
                lastWorkingBPM: 84,
                delivery: DateTime(2026, 10, 5),
              ),
              HomeLastPracticedWidget(
                pieceName: "Do majör gam · 2 oktav",
                lastPracticeDate: DateTime(2026, 10, 1),
                accuracy: 91,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
