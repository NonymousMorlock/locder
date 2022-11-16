// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:locder/app/app.dart';
import 'package:locder/src/landing/presentation/views/landing_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders LandingScreen', (tester) async {
      await tester.pumpWidget(const App('TEST'));
      expect(find.byType(LandingScreen), findsOneWidget);
    });
  });
}
