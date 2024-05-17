import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageBackButton extends StatelessWidget {
  const ImageBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(fit: StackFit.expand,children: [
        SvgPicture.asset(
          "assets/pics/back.svg",
          height: 20,
          width: 20,
          color: Colors.black,
        ),
        SvgPicture.asset(
          "assets/pics/back.svg",
          height: 20,
          width: 20,
        )
      ]),
      onTap: () {
        Navigator.maybePop(context);
      },
    );
  }
}
