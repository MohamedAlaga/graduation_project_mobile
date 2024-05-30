import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class S_Image extends StatelessWidget {
  const S_Image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SvgPicture.asset(
        "assets/pics/line2.svg",
        fit: BoxFit.fill,
      ),
    );
  }
}
