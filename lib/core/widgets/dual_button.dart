import 'package:flutter/material.dart';
import 'package:locder/core/extensions/dimension_extensions.dart';

class DualButton extends StatelessWidget {
  const DualButton({
    super.key,
    this.onFirstSideTap,
    this.onSecondSideTap,
    required this.firstChild,
    required this.secondChild,
    this.firstSideColour,
    this.secondSideColour,
    this.firstSidePadding,
    this.secondSidePadding,
    this.secondSideHeight = true,
  });

  final VoidCallback? onFirstSideTap;
  final VoidCallback? onSecondSideTap;
  final Widget firstChild;
  final Widget secondChild;
  final Color? firstSideColour;
  final Color? secondSideColour;
  final bool secondSideHeight;
  final EdgeInsetsGeometry? firstSidePadding;
  final EdgeInsetsGeometry? secondSidePadding;

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    final half = cs.width * .8 / 2;
    final padding = EdgeInsets.symmetric(
      horizontal: 16.adapt(cs.width),
      vertical: 10.adapt(cs.height),
    );
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(
        25.adapt(cs.width),
      ),
    );
    return Center(
      child: Container(
        width: cs.width * .8,
        height: 63.adapt(cs.height),
        decoration: decoration,
        child: Row(
          children: [
            GestureDetector(
              onTap: onFirstSideTap,
              child: Container(
                padding: firstSidePadding,
                height: 52.adapt(cs.height),
                decoration: decoration.copyWith(
                  color: firstSideColour,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.adapt(cs.width)),
                  ),
                ),
                width: half,
                child: firstChild,
              ),
            ),
            GestureDetector(
              onTap: onSecondSideTap,
              child: Container(
                padding: secondSidePadding,
                height: secondSideHeight ? 52.adapt(cs.height) : null,
                decoration: decoration.copyWith(
                  color: secondSideColour,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(25.adapt(cs.width)),
                  ),
                ),
                width: half,
                child: secondChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
