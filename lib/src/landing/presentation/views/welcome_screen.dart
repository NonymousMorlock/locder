import 'package:flutter/material.dart';
import 'package:locder/core/extensions/dimension_extensions.dart';
import 'package:locder/core/utils/constants.dart';
import 'package:locder/src/landing/presentation/components/auth_card.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const id = '/welcome';

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${kImageRoot}background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80.adapt(cs.height)),
            Text(
              'Welcome...',
              style: TextStyle(
                fontFamily: 'Italianno',
                fontWeight: FontWeight.w400,
                fontSize: 77.adapt(cs.height),
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 30.adapt(cs.height)),
            const Expanded(
              child: AuthCard(),
            ),
          ],
        ),
      ),
    );
  }
}
