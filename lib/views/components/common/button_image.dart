import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class button_image extends StatelessWidget {
  const button_image({
    required this.bcolor,
    required this.b_border,
    required this.nText,
    required this.nImage,
    required this.nhight,
    required this.nwidth,
    // required this.baction,
    super.key,
  });
  final double b_border;
  final double nhight;
  final double nwidth;
  final String nImage;
  final Color bcolor;
  final String nText;
  // final Function baction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // اللينك مكان الامر
        print('Login with Facebook');
      },
      child: Container(
        width: nwidth,
        height: nhight,
        decoration: BoxDecoration(
            color: bcolor,
            borderRadius: BorderRadius.circular(b_border),
            border: Border.all(
                color: Colors.black, style: BorderStyle.solid, width: 2),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                color: Colors.black,
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              'assets/pics/$nImage',
              width: 32,
              height: 32,
            ),
            SizedBox(width: 10),
            C_Text(
                w_font: FontWeight.w500,
                text: nText,
                ffamily: 'OMNES-ARABIC',
                fsized: 32,
                fcolor: Colors.white)
          ],
        ),
      ),
    );
  }
}
