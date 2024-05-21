import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'core/utils/size_config.dart';
class GoogleFacebookContainer extends StatelessWidget {
  String text;
  String logo ;
  var fun;
   GoogleFacebookContainer({required this.logo,required this.text,this.fun,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: SizeConfig.screenHeight!*0.065,
        width: SizeConfig.screenWidth!*0.43,
        decoration: ShapeDecoration(
          color: mainRed,
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(radius: 17,
                backgroundImage:AssetImage(logo),),
            Text(
              text,
              style: Styles.style32w500,
            )
          ],
        ),
      ),
    );
  }
}
