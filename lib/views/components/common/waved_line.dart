  import 'package:flutter/material.dart';

class WavedLine extends StatelessWidget {
  const WavedLine({
    super.key,this.link ="assets/pics/app_bar_line.png"
  });
  final String link;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Image.asset(link
          ,
          fit: BoxFit.fitWidth,
        ));
  }
}