import 'package:aabkr/views/components/common/setting_dialoge.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:aabkr/views/components/common/paragraph_text.dart';
///
class CircularBtnWithTxt extends StatelessWidget {
  const CircularBtnWithTxt({
    super.key,
    required this.path,
    required this.txt,
    this.imgsize=60,
    this.txtsize=12,
    required this.onpress,
  });
 final String path;
 final String txt;
 final double txtsize;
 final double imgsize;
 final Function onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){onpress();},
      child: Column(
        children: [
          SvgPicture.asset(path
            ,
            height: imgsize,
            width: imgsize,
          ),const SizedBox(
                            height: 4,
                          ),
           ParagrahpText(
            txt: txt,
            size: txtsize,
          )
        ],
      ),
    );
  }
}
