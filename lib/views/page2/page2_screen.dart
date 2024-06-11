import 'package:aabkr/views/commonComponents/common_button.dart';
import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'package:aabkr/views/commonComponents/galaxy_text.dart';
import 'package:aabkr/views/page11.dart';
import 'package:aabkr/views/page7/page7_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../page3/page3_screen.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainPageColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 128,
                right: 42,
                left: 42,
                child: SvgPicture.asset('assets/pics/yellowAge.svg')),
            const Positioned(
                top: 218,
                right: 102,
                left: 102,
                child: GalaxyText(
                  text: 'كم عمرك',
                  fontSize: 48,
                )),
            Positioned(
                bottom: 222,
                right: 72,
                left: 72,
                child: CommonButton(
                  buttonColor: mainGreen,
                  text: '6 - 12',
                  fun: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page7(),
                        ),
                        (route) => false);
                  },
                )),
            Positioned(
                bottom: 124,
                right: 72,
                left: 72,
                child: CommonButton(
                  buttonColor: mainRed,
                  text: '13 - 18',
                  fun: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Page11(),));},
                )),
          ],
        ),
      ),
    );
  }
}
