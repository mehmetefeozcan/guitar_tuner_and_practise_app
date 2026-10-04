import 'package:guitar_tuner_and_practise_app/features/not_found/view/not_found_view.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_router.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/custom_transition.dart';
import 'package:guitar_tuner_and_practise_app/core/constants/app_constants.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: AppConstants.navigatorKey,
    initialLocation: MainRoutes.splash,
    debugLogDiagnostics: kDebugMode,
    observers: [routeObserver],
    routes: [...MainRouter.routes],
    errorPageBuilder: (context, state) => RouterTransitionHelper.build(
      state: state,
      child: const NotFoundView(),
      type: PageTransitionType.fade,
      useCupertinoOnIOS: false,
    ),
  );
}
