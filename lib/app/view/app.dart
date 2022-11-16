// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:locder/l10n/l10n.dart';
import 'package:locder/router.dart';
import 'package:locder/src/landing/presentation/views/landing_screen.dart';

class App extends StatelessWidget {
  const App(this.flavour, {super.key}) : isDev = flavour == 'DEV';

  final String flavour;
  final bool isDev;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      useInheritedMediaQuery: isDev,
      builder: isDev ? DevicePreview.appBuilder : null,
      locale: isDev ? DevicePreview.locale(context) : null,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: LandingScreen.id,
      onGenerateRoute: generateRoute,
    );
  }
}
