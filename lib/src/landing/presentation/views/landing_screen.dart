import 'package:flutter/material.dart';
import 'package:locder/core/extensions/dimension_extensions.dart';
import 'package:locder/core/utils/constants.dart';
import 'package:locder/core/widgets/github_logo.dart';
import 'package:locder/core/widgets/rounded_button.dart';
import 'package:locder/src/landing/presentation/views/welcome_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  // TODO(initialRoute): Change his to /landing and use [SplashScreen] as /
  static const id = '/';

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
        child: Padding(
          padding: EdgeInsets.only(bottom: 50.adapt(cs.height)),
          child: Stack(
            children: [
              const Center(
                child: Hero(
                  tag: 'githubLogo',
                  child: GithubLogo(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RoundedButton(
                  text: 'Get Started',
                  backgroundColour: Colors.black.withOpacity(.6),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25.adapt(cs.height),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
