import 'package:flutter/material.dart';

class PNG_button extends StatelessWidget {
  const PNG_button({
    required this.png_Logo,
    required this.png_widget,
    super.key,
  });
  final String png_Logo;
  final Widget png_widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => png_widget),
        );
      },
      child: Image.asset('assets/pics/$png_Logo'),
    );
  }
}
