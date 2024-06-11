import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commonComponents/common_button.dart';
import '../commonComponents/common_text_field.dart';
import '../commonComponents/core/utils/constants.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../commonComponents/galaxy_text.dart';
import '../page7/page7_screen.dart';

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold( backgroundColor: mainPageColor,
      body: SafeArea(
          child: Stack(
            children: [
              const Positioned(
                top: 54,
                right: 44,
                left: 44,
                child: GalaxyText(
                fontSize: 36,
                text: 'اعادة تعين كلمة المرور',
              )),
             Positioned(
               top: 92,
               right: 58,
               left: 58,
               child: SvgPicture.asset('assets/pics/blueResetPass.svg')),
              const Positioned(top: 131,
                  right: 91,
                  left: 87,
                  child: Image(image: AssetImage('assets/pics/Face with peeking eye.png'))),
              Positioned(
                  top: 361,
                  right: 16,
                  left: 16,
                  child: CommonTextField(title:'كلمة المرور الجديدة' )),
              Positioned(
                  top: 434,
                  right: 16,
                  left: 16,
                  child: CommonTextField(title:'تأكيد كلمة المرور' )),
              Positioned(
                  top: 577,
                  right: 102,
                  left: 102,
                  child: CommonButton(fun: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => const Page7(),), (route) => false);
                  },
                      buttonColor: mainGreen, text: 'انهاء'),
              ),
        ],
      )),
    );
  }
}
