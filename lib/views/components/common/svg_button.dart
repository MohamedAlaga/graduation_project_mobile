import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVG_button extends StatelessWidget {
  const SVG_button({
    required this.svg_Logo,
    required this.svg_widget,
    super.key,
  });
  final String svg_Logo;
  final Widget svg_widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => svg_widget),
        );

        // print('this has clicked');
      },
      child: SvgPicture.asset('assets/pics/$svg_Logo'),
    );
  }
}
