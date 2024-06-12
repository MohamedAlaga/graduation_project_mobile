import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
   const HeadlineText({
    super.key,required this.title,this.fsize = 36
  });
  final String title;
  final double fsize;
  @override
  Widget build(BuildContext context,) {
    return Stack(children: [
      Text(title,
          style: TextStyle(
              fontSize: fsize,
              fontFamily: "AA-GALAXY",
              fontWeight: FontWeight.bold,
              shadows: const[
                Shadow(
                  color: Colors.black,
                  offset: Offset(0, 6 ),
                )
              ],
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.black)),
      Text(
        title,
        style:  TextStyle(fontSize: fsize,
              fontFamily: "AA-GALAXY",
              fontWeight: FontWeight.bold,
              color: Colors.white),
      )
    ]);
  }
}
