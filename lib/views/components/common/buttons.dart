import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({
    required this.b_border,
    required this.bHieght,
    required this.bWidth,
    required this.bText,
    required this.bcolor,
    required this.bF_Text,
    required this.b_fun,
    this.fcolor = Colors.white,
    super.key,
  });
  final double bWidth;
  final double b_border;
  final String bText;
  final Color bcolor;
  final Color fcolor ;

  final double bF_Text;
  final double bHieght;
  final Function() b_fun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: b_fun,
      child: Container(
        alignment: Alignment.center,
          width: bWidth,
          height: bHieght,
          decoration: BoxDecoration(
              color: bcolor,
              borderRadius: BorderRadius.circular(b_border),
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              boxShadow: const[
                 BoxShadow(
                  offset: Offset(0, 4),
                  color: Colors.black,
                )
              ]),
          child: Ink(
            child: C_Text(
                w_font: FontWeight.w600,
                text: bText,
                ffamily: 'OMNES-ARABIC',
                fsized: bF_Text,
                fcolor: fcolor),
          )),
    );
  }
}
