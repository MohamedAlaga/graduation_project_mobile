import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../commonComponents/core/utils/constants.dart';
import '../../commonComponents/core/utils/size_config.dart';
import '../../commonComponents/galaxy_text.dart';
AppBar quizAppBar( BuildContext context) {
  return AppBar(toolbarHeight: 55,centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        surfaceTintColor: Colors.transparent,
        elevation: 10,
    title: const Center(child: Center(child: GalaxyText(fontSize: 32, text: 'لا  تتوتر'))),
    leadingWidth: 50,
    forceMaterialTransparency: true,
    actions: const [
      SizedBox(width: 45),
    ],
    leading: Center(
      child: InkWell(
          onTap: () {Navigator.pop(context);},
          child:SvgPicture.asset('assets/pics/arrow_back.svg')),
    ),

    bottom:  PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child:  Image.asset('assets/pics/app_bar_line.png',fit: BoxFit.fill,width: double.infinity,)
    ),
  );
}