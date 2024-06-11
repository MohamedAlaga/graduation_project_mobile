import 'package:flutter/material.dart';

class ParagrahpText extends StatelessWidget {
  const ParagrahpText({
    super.key, required this.txt,this.size =20.0,this.fcolor = Colors.black
  });
final String txt;
final double size;
final Color fcolor;
  @override
  Widget build(BuildContext context) {
    return  Text(
      txt,
      style: TextStyle(color:fcolor ,
        fontFamily: "OMNES-ARABIC",
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
