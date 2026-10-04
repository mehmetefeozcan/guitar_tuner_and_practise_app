// tuning_view.dart

import 'package:guitar_tuner_and_practise_app/features/tuning/widgets/quick_tuning_type_select_widget.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/widgets/frequency_select_widget.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/widgets/tuner_readout_widget.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/theme_context_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/core/widgets/appbars/sub_page_appbar.dart';
import 'package:guitar_tuner_and_practise_app/features/tuning/store/tuning_store.dart';
import 'package:guitar_tuner_and_practise_app/core/extension/main_extension.dart';
import 'package:guitar_tuner_and_practise_app/core/assets/app_assets.dart';
import 'package:guitar_tuner_and_practise_app/core/theme/app_colors.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_store.dart';
import 'package:guitar_tuner_and_practise_app/core/base/base_view.dart';
import 'package:guitar_tuner_and_practise_app/core/di/locator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubPageAppbar(
        title: context.l10n.tuning,
        centerTitle: false,
        backRoute: MainRoutes.home,
        actions: [
          FrequencySelectWidget(),
          SizedBox(width: 16.w),
        ],
      ),
      body: SafeArea(
        minimum: context.screenPadding,
        child: Column(
          children: [
            const QuickTuningTypeSelectWidget(),
            SizedBox(height: context.space6),
            buildNoteInfo(context),
            SizedBox(height: context.space5),
            const TunerReadoutWidget(),
            SizedBox(height: 20.w),
            buildTuneScore(context),
            Spacer(),
            buildStrings(context),
          ],
        ),
      ),
    );
  }

  Widget buildNoteInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "A",
                style: context.displayLarge!.copyWith(
                  fontSize: 92.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(text: " "),
              TextSpan(
                text: "2",
                style: context.readout.copyWith(color: AppColors.darkInkMuted),
              ),
            ],
          ),
        ),
        Text(
          "109.50 Hz",
          style: context.numericS.copyWith(
            color: AppColors.darkInkMuted,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }

  Widget buildStrings(BuildContext context) {
    List strings = ["E2", "A2", "D3", "G3", "B3", "E4"];
    int selected = 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.space2,
      children: [
        Text(
          context.l10n.strings.toUpperCase(),
          style: context.titleSmall!.copyWith(color: AppColors.darkInkSubtle),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: context.space2,
          children: List.generate(
            strings.length,
            (index) => Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: context.space3,
                  horizontal: context.space2,
                ),
                decoration: BoxDecoration(
                  color: index == selected
                      ? AppColors.darkAccent
                      : AppColors.darkSurface200,
                  borderRadius: BorderRadius.circular(context.radiusSm),
                  border: Border.all(width: 1, color: AppColors.darkBorder),
                ),
                width: context.width,
                child: Center(child: Text(strings[index])),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTuneScore(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      spacing: context.space2,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icons.minus,
              width: 32.w,
              height: 32.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkSignalOff,
                BlendMode.srcIn,
              ),
            ),
            Text(
              "12",
              style: context.readoutXl.copyWith(
                fontSize: 42.sp,
                color: AppColors.darkSignalOff,
              ),
            ),
          ],
        ),
        Text(
          context.l10n.flat.toUpperCase(),
          style: context.titleSmall!.copyWith(color: AppColors.darkSignalOff),
        ),
      ],
    );
  }
}
