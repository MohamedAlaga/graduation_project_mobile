import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../commonComponents/core/utils/constants.dart';
import '../../commonComponents/core/utils/size_config.dart';
import '../../commonComponents/core/utils/styles.dart';
import '../../commonComponents/galaxy_text.dart';
AppBar quizAnswersAppBar() {
  return AppBar(toolbarHeight: 55,
    title: const Center(child: Row(
      children: [
        SizedBox(width: 73,),
        GalaxyText(fontSize: 32, text: 'اجاباتك'),
      ],
    )),
    backgroundColor: mainPageColor,
    leadingWidth: 50,
    elevation: 0,
    forceMaterialTransparency:true ,
    actions:  [
      Column(
        children: [
          const Text('خطأ',style: Styles.style20r,),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainRed,
              border: Border.all(color: Colors.black),
            ),
          ),

        ],
      ),
      const SizedBox(width: 10),
      Column(
        children: [
          const Text('صح',style: Styles.style20g,),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainGreen,
              border: Border.all(color: Colors.black),
            ),
          ),

        ],
      ),
      const SizedBox(width: 20),
    ],
    leading:Center(
      child: InkWell(onTap: (){},
          child: SvgPicture.asset('assets/images/arrow_back.svg',fit: BoxFit.scaleDown,)
      ),
    ) ,

    bottom: PreferredSize(preferredSize:  Size.fromHeight(SizeConfig.screenHeight!*0.04),
        child: SvgPicture.asset('assets/images/appBar.svg')),
  );
}
