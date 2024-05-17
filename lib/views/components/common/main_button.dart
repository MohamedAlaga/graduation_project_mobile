import 'package:aabkr/views/components/common/setting_dialoge.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
    const MainButton(
      {super.key,
      required this.title,
      this.padd = 20.0,
      this.bcolor = const Color(0xFF1FCC7B),
      this.fcolor = Colors.white,
      this.onpress = callDialog,});
  final String title;
  final double padd;
  final Color bcolor;
  final Color fcolor;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ onpress();},
      child: Container(
        decoration: BoxDecoration(
            color: bcolor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 4.0),
                  spreadRadius: 0.0)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            border: Border.all(color: Colors.black, width: 2.0)),
        child: Padding(
          padding: EdgeInsets.only(right: padd, left: padd),
          child: Text(textAlign: TextAlign.center,
            title,
            style:  TextStyle(
              fontFamily: "OMNES-ARABIC",
              color: fcolor,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

}
