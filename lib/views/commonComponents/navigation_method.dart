import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../page2/page2_screen.dart';
void navigateToGetStarted() {
  Future.delayed(const Duration(seconds: 1),() {
    Get.to(()=> const Page2(),transition: Transition.fadeIn,duration:const Duration(milliseconds: 250) );},);
}


