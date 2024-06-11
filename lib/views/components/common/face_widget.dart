import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaceWidget extends StatelessWidget {
  const FaceWidget({
    super.key,
    required this.facePath,
    this.cover = "assets/pics/nerd_face_cover.svg",
  });
  final String facePath;
  final String cover ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(cover),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(facePath),
        ),
      ],
    );
  }
}