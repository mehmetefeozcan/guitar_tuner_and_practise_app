// home_view.dart

import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/widgets/index.dart';
import 'package:studio_accordo_app_mobile/features/home/store/home_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
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
    final store = _store!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: context.screenPadding,
          physics: BouncingScrollPhysics(),
          child: Column(
            spacing: context.space5,
            children: [
              HomeAppbarWidget(greeting: store.greeting),
              Observer(
                builder: (context) {
                  final progress = store.weeklyProgress;

                  if (progress == null) return const SizedBox.shrink();

                  return HomeWeeklyProgressWidget(progress: progress);
                },
              ),
              const HomeShortcutsWidget(),
              Observer(
                builder: (context) {
                  final homework = store.currentHomework;

                  if (homework == null) return const SizedBox.shrink();

                  return HomeHomeworkWidget(item: homework);
                },
              ),
              Observer(
                builder: (context) {
                  final entry = store.lastPracticed;

                  if (entry == null) return const SizedBox.shrink();

                  return HomeLastPracticedWidget(entry: entry);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
