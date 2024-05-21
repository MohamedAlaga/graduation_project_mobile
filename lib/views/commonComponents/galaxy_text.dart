import 'package:flutter/material.dart';
class GalaxyText extends StatelessWidget {
  final String text;
  final double fontSize ;
  const GalaxyText({required this.fontSize,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Black border text
          Text(
            maxLines: 5,
            softWrap: true,
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'AA-GALAXY',
              fontWeight: FontWeight.w700,
              height: 0.02,
              letterSpacing: -0.41,
              shadows: const [
                Shadow(
                  color: Color(0xFF000000),
                  blurRadius: 0,
                  offset: Offset(0, 5),
                )
              ],
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = Colors.black,
            ),
          ),
          // White text on top
           Text(
             maxLines: 5,
             softWrap: true,
            text,
            style:  TextStyle(fontSize: fontSize, color: Colors.white,
              fontFamily: 'AA-GALAXY',
              fontWeight: FontWeight.w700,
              height: 0.02,
              letterSpacing: -0.41,),
                     ),
        ],
      ),
    );
  }
}
