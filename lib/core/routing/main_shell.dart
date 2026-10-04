import 'package:guitar_tuner_and_practise_app/core/widgets/bottom_navbar/general_bottom_navbar.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MainShell extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const MainShell({super.key, required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: GeneralBottomNavbar(currentPath: state.uri.path),
    );
  }
}
