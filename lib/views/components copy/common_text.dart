import 'package:flutter/material.dart';

class C_Text extends StatelessWidget {
  const C_Text({
    required this.w_font,
    required this.text,
    required this.ffamily,
    required this.fsized,
    required this.fcolor,
    super.key,
  });
  final String text;
  final String ffamily;
  final double fsized;
  final Color fcolor;
  final FontWeight w_font;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: w_font,
          color: fcolor,
          fontFamily: ffamily,
          fontSize: fsized),
    );
  }
}
