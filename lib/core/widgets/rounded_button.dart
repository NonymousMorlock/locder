import 'package:flutter/material.dart';
import 'package:locder/core/extensions/dimension_extensions.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.backgroundColour,
    this.foregroundColour,
    required this.text,
    this.textStyle,
    this.onPressed,
  });

  final Color? backgroundColour;
  final Color? foregroundColour;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColour ?? Colors.black87,
        foregroundColor: foregroundColour,
        minimumSize: Size(cs.width * .8, 63),
        padding: EdgeInsets.symmetric(
          horizontal: 16.adapt(cs.width),
          vertical: 10.adapt(cs.height),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.adapt(cs.width))),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
