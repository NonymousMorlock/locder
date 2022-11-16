import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locder/core/extensions/dimension_extensions.dart';
import 'package:locder/core/utils/colours.dart';
import 'package:locder/core/utils/constants.dart';
import 'package:locder/core/widgets/dual_button.dart';
import 'package:locder/core/widgets/github_logo.dart';
import 'package:locder/core/widgets/rounded_button.dart';
import 'package:locder/src/home/presentation/views/home_screen.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(
        20.adapt(cs.width),
        60.adapt(cs.height),
        20.adapt(cs.width),
        50.adapt(cs.height),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${kImageRoot}map_background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Hero(
            tag: 'githubLogo',
            child: GithubLogo(),
          ),
          const Spacer(),
          RoundedButton(
            text: 'Sign in with email',
            backgroundColour: Colours.darkBlueColour,
            textStyle: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24.adapt(cs.height),
            ),
            onPressed: () {
              // TODO(SignIn): Implement signIn functionality
              _tempHandler(context, toast: 'Sign In');
            },
          ),
          SizedBox(height: 10.adapt(cs.height)),
          DualButton(
            firstChild: Center(
              child: Text(
                'Sign up with',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 20.adapt(cs.height),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onFirstSideTap: () => _tempHandler(context, toast: 'Sign Up With'),
            onSecondSideTap: () => _tempHandler(context, toast: 'Google'),
            firstSideColour: Colors.blue,
            secondChild: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      '${kImageRoot}google_64.png',
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 5.adapt(cs.width)),
                  const Text(
                    'Google',
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1.3,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            firstSidePadding: EdgeInsets.symmetric(
              horizontal: 10.adapt(cs.width),
            ),
            secondSideColour: const Color(0xff191c1e),
          ),
        ],
      ),
    );
  }

  void _tempHandler(BuildContext context, {required String toast}) {
    HapticFeedback.vibrate();
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(toast)));
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }
}
