import 'package:flutter/material.dart';
import 'package:locder/core/extensions/dimension_extensions.dart';
import 'package:locder/core/utils/constants.dart';
import 'package:locder/src/landing/presentation/views/landing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const id = '/home';

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${kImageRoot}blue_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 80.adapt(cs.height),
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.adapt(cs.width)),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('${kImageRoot}dark_blue_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: (80 - 28).adapt(cs.width),
              right: 25.adapt(cs.width),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, LandingScreen.id);
                },
                child: Hero(
                  tag: 'githubLogo',
                  child: CircleAvatar(
                    radius: 28.adapt(cs.width),
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        const AssetImage('${kImageRoot}avatar.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
