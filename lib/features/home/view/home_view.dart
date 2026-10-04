// home_view.dart

import 'package:guitar_tuner_and_practise_app/features/home/store/home_store.dart';
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
    return Scaffold();
  }
}
