import 'package:flutter/material.dart';


class GithubLogo extends StatelessWidget {
  const GithubLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      width: 118,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue,
          width: 5,
        ),
      ),
      child: Image.asset('assets/images/fat_github_logo.png'),
    );
  }
}

