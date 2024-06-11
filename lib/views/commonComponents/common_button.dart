import 'package:aabkr/views/commonComponents/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'core/utils/styles.dart';

class CommonButton extends StatelessWidget {
  final String text;
  var fun;
  final Color buttonColor;

  CommonButton(
      {required this.buttonColor,
      this.fun,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: SizeConfig.screenHeight!*0.06,
        width: SizeConfig.screenWidth,
        decoration: ShapeDecoration(
          color: buttonColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2),
            borderRadius: BorderRadius.circular(14),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0xFF000000),
              blurRadius: 0,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.style32w600,
                  ),
        ),
      ),
    );
  }
}
