import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/routing/custom_transition.dart';
import 'package:studio_accordo_app_mobile/core/routing/main_shell.dart';

import 'package:go_router/go_router.dart';

// Page Imports
import 'package:studio_accordo_app_mobile/features/under_construction/view/under_construction_view.dart';
import 'package:studio_accordo_app_mobile/features/tuning/view/tuning_view.dart';
import 'package:studio_accordo_app_mobile/features/splash/view/splash_view.dart';
import 'package:studio_accordo_app_mobile/features/home/view/home_view.dart';

class MainRouter {
  static List<RouteBase> routes = [
    GoRoute(
      path: MainRoutes.splash,
      pageBuilder: (context, state) {
        return RouterTransitionHelper.build(
          state: state,
          child: const SplashView(),
          type: PageTransitionType.fade,
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) => MainShell(state: state, child: child),
      routes: [
        GoRoute(
          path: MainRoutes.home,
          pageBuilder: (context, state) {
            return RouterTransitionHelper.build(
              state: state,
              child: const HomeView(),
              type: PageTransitionType.fade,
              useCupertinoOnIOS: false,
            );
          },
        ),
        GoRoute(
          path: MainRoutes.library,
          pageBuilder: (context, state) {
            return RouterTransitionHelper.build(
              state: state,
              // child: const MyLibraryView(),
              child: UnderConstructionView(title: context.l10n.library),
              type: PageTransitionType.fade,
              useCupertinoOnIOS: false,
            );
          },
        ),
        GoRoute(
          path: MainRoutes.progress,
          pageBuilder: (context, state) {
            return RouterTransitionHelper.build(
              state: state,
              // child: const ProgressView(),
              child: UnderConstructionView(title: context.l10n.progress),
              type: PageTransitionType.fade,
              useCupertinoOnIOS: false,
            );
          },
        ),
        GoRoute(
          path: MainRoutes.profile,
          pageBuilder: (context, state) {
            return RouterTransitionHelper.build(
              state: state,
              // child: const ProfileView(),
              child: UnderConstructionView(title: context.l10n.profile),
              type: PageTransitionType.fade,
              useCupertinoOnIOS: false,
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: MainRoutes.tuning,
      pageBuilder: (context, state) {
        return RouterTransitionHelper.build(
          state: state,
          child: const TuningView(),
          type: PageTransitionType.fade,
          useCupertinoOnIOS: false,
        );
      },
    ),
  ];
}
