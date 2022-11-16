import 'package:flutter/material.dart';
import 'package:locder/src/home/presentation/views/home_screen.dart';
import 'package:locder/src/landing/presentation/views/landing_screen.dart';
import 'package:locder/src/landing/presentation/views/welcome_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LandingScreen.id:
      return _pageBuilder(
        const LandingScreen(),
        settings: settings,
      );
    case WelcomeScreen.id:
      return _pageBuilder(
        const WelcomeScreen(),
        settings: settings,
      );
    case HomeScreen.id:
      return _pageBuilder(
        const HomeScreen(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        Scaffold(
          body: Center(
            child: Text('Nothing to see here\n${settings.name} '
                "doesn't exist yet"),
          ),
        ),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, a, __, c) =>
          FadeTransition(opacity: a, child: c));
}
