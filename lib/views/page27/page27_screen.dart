import 'package:abkar/view/commonComponents/core/utils/constants.dart';
import 'package:abkar/view/commonComponents/galaxy_text.dart';
import 'package:abkar/view/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../commonComponents/common_button.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../commonComponents/core/utils/styles.dart';
class Page27 extends StatelessWidget {
  const Page27({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: GalaxyText(fontSize: 32, text: 'شهادة  المستوى')),
        backgroundColor: Colors.transparent,
        leadingWidth: 50,
        centerTitle:true ,
        elevation: 0,
        actions: const [
          SizedBox(width: 45,)
        ],
        leading:Center(
          child: InkWell(onTap: (){},
              child: SvgPicture.asset('assets/images/arrow_back.svg',fit: BoxFit.scaleDown,)
          ),
        ) ,
        bottom: PreferredSize(preferredSize:  Size.fromHeight(SizeConfig.screenHeight!*0.04),
            child: SvgPicture.asset('assets/images/appBar.svg')),
      ),
      backgroundColor: mainPageColor,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top:20,
                right: 70,
                left: 70,
                child: Row(
                  children: [
                    Text('🥳',style: Styles.style32w600),
                    Text(' مبروووك ',style: Styles.style36black),
                    Text('🥳',style: Styles.style32w600),
                  ],
                )),
            Positioned(top: 90,
                right: 16,
                left: 16,
                child: SvgPicture.asset('assets/images/certificate.svg')),
            const  Positioned(
              top: 182,
              right: 70,
              left: 70,
              child: Center(child: Text('تصميم الشهادة',style: Styles.style36black,)),),
            Positioned(
                top: 340,
                right: 68,
                left: 68,
                child: CommonButton(buttonColor: const Color(0xff00dcea), text: 'تحميل الشهادة')),
            Positioned(
                top: 449,
                right: 16,
                left: 16,
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   const Text('انت الأن مؤهل للانتقال',style: Styles.style32black),
                    SizedBox(height: SizeConfig.screenHeight!*0.05,),
                    const Text('الي المستوي الثاني',style: Styles.style32black),
                  ],
                )),
            Positioned(
                bottom: 40,
                right: 24,
                left: 22,
                child: CommonButton(fun:(){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => QuizPage(),), (route) => false);
                },
                    buttonColor: const Color(0xff1fcc7b), text: 'انتقل الي المستوى الثاني')),
          ],
        ),
      ),
    );
  }
}
