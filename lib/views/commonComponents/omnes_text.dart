import 'package:flutter/material.dart';
class OmnesText extends StatelessWidget {
  String text;
  Color color ;

 OmnesText({required this.color,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Black border text
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Omnes Arabic',
              fontWeight: FontWeight.w600,
             // height: 0.06,
              letterSpacing: -0.41,
              shadows: const [
                Shadow(
                  color: Color(0xFF000000),
                  blurRadius: 0,
                  offset: Offset(0, 3),
                )
              ],
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = Colors.black
            ),
          ),
          // White text on top
          Text(
            text,
            style: TextStyle(fontSize: 20, color: color,
              fontFamily: 'Omnes Arabic',
              fontWeight: FontWeight.w600,
            // height: 0.06,
              letterSpacing: -0.41,
            ),
          ),
        ],
      ),
    );
  }
}
