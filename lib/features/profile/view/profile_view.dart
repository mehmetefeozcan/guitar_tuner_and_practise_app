// profile_view.dart

import 'package:guitar_tuner_and_practise_app/features/profile/store/profile_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_view.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with BaseViewMixin<ProfileView> {
  ProfileStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<ProfileStore>();

    await _store!.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
