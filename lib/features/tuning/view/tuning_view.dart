// tuning_view.dart

import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/features/tuning/widgets/index.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/appbars/index.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class TuningView extends StatefulWidget {
  const TuningView({super.key});

  @override
  State<TuningView> createState() => _TuningViewState();
}

class _TuningViewState extends State<TuningView>
    with BaseViewMixin<TuningView> {
  TuningStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<TuningStore>();

    await _store!.initApp();
  }

  @override
  void onDispose() {
    _store?.disposeStore();
  }

  @override
  Widget build(BuildContext context) {
    final store = _store!;

    return Scaffold(
      appBar: SubPageAppbar(
        title: context.l10n.tuning,
        centerTitle: false,
        backRoute: MainRoutes.home,
        actions: [FrequencySelectWidget(store: store), SizedBox(width: 16.w)],
      ),
      body: SafeArea(
        minimum: context.screenPadding,
        child: Column(
          children: [
            QuickTuningTypeSelectWidget(store: store),
            SizedBox(height: context.space6),
            TunerNoteInfoWidget(store: store),
            SizedBox(height: context.space5),
            Observer(
              builder: (context) => TunerReadoutWidget(
                cents: store.reading?.cents,
                inTune: store.isInTune,
              ),
            ),
            SizedBox(height: 20.w),
            TunerCentsWidget(store: store),
            Spacer(),
            Observer(
              builder: (context) => store.selectedTuning.isChromatic
                  ? const SizedBox.shrink()
                  : TuningStringsWidget(store: store),
            ),
          ],
        ),
      ),
    );
  }
}
