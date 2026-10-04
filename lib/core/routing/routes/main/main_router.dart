import 'package:guitar_tuner_and_practise_app/core/routing/routes/main/main_routes.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/custom_transition.dart';
import 'package:guitar_tuner_and_practise_app/core/routing/main_shell.dart';

import 'package:go_router/go_router.dart';
import 'package:guitar_tuner_and_practise_app/features/my_library/view/my_library_view.dart';
import 'package:guitar_tuner_and_practise_app/features/profile/view/profile_view.dart';
import 'package:guitar_tuner_and_practise_app/features/progress/view/progress_view.dart';

// Page Imports

import 'package:guitar_tuner_and_practise_app/features/splash/view/splash_view.dart';
import 'package:guitar_tuner_and_practise_app/features/home/view/home_view.dart';

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
              child: const MyLibraryView(),
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
              child: const ProgressView(),
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
              child: const ProfileView(),
              type: PageTransitionType.fade,
              useCupertinoOnIOS: false,
            );
          },
        ),
      ],
    ),
  ];
}
