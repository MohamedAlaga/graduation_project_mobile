import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'package:aabkr/views/commonComponents/core/utils/size_config.dart';
import 'package:aabkr/views/commonComponents/galaxy_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar quizAppBar() {
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
          onTap: () {},
          child:SvgPicture.asset('assets/images/arrow_back.svg')),
    ),

    bottom: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.screenHeight! * 0.04),
        child: SvgPicture.asset('assets/images/appBar.svg')),
  );
}