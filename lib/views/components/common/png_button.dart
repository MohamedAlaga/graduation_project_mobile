import 'package:flutter/material.dart';

class PNG_button extends StatelessWidget {
  const PNG_button({
    required this.png_Logo,
    required this.func,
    super.key,
  });
  final String png_Logo;
  final Function func;
  @override
  Widget build(BuildContext context) {
    
      return GestureDetector(
        onTap: () {
          func();
        },
        child: Image.asset('assets/pics/$png_Logo'),
      );
  }
}
