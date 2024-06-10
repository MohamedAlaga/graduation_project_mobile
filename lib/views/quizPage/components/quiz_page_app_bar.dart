import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../commonComponents/core/utils/constants.dart';
import '../../commonComponents/core/utils/size_config.dart';
import '../../commonComponents/galaxy_text.dart';
AppBar quizAppBar( BuildContext context) {
  return AppBar(toolbarHeight: 55,
    title: const Center(child: Center(child: GalaxyText(fontSize: 32, text: 'لا  تتوتر'))),
    backgroundColor: mainPageColor,
    leadingWidth: 50,
    elevation: 0,
    forceMaterialTransparency: true,
    actions: const [
      SizedBox(width: 45),
    ],
    leading: Center(
      child: InkWell(
          onTap: () {Navigator.pop(context);},
          child:SvgPicture.asset('assets/pics/arrow_back.svg')),
    ),

    bottom: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.screenHeight! * 0.04),
        child: SvgPicture.asset('assets/pics/appBar.svg')),
  );
}