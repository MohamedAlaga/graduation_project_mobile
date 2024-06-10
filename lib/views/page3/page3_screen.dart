import 'package:aabkr/controllers/login_controller.dart';
import 'package:aabkr/views/Page10.dart';
import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/commonComponents/common_button.dart';
import 'package:aabkr/views/commonComponents/common_text_field.dart';
import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'package:aabkr/views/commonComponents/divider.dart';
import 'package:aabkr/views/commonComponents/galaxy_text.dart';
import 'package:aabkr/views/commonComponents/google_facebook_container.dart';
import 'package:aabkr/views/commonComponents/omnes_text.dart';
import 'package:aabkr/views/page2/page2_screen.dart';
import 'package:aabkr/views/page4.dart';
import 'package:aabkr/views/page7/page7_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../commonComponents/core/utils/styles.dart';

class Page3 extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   Page3({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      backgroundColor: mainPageColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              const Positioned(
                  top: 38,
                  right: 90,
                  left: 89,
                  child: GalaxyText(
                    fontSize: 36,
                    text: 'تسجيل  الدخول',
                  )),
              Positioned(
                  top: 78,
                  right: 58,
                  left: 58,
                  child: SvgPicture.asset('assets/pics/yellowLogin.svg')),
              const Positioned(
                  top: 108,
                  right: 69,
                  left: 97,
                  child: Image(image: AssetImage('assets/pics/boy.png'))),
              Positioned(
                  top: 290,
                  right: 16,
                  left: 16,
                  child: CommonTextField(
                      title: 'البريد الالكتروني',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' البريد الالكتروني مطلوب';
                        } else if (!value.endsWith('.com')) {
                          return 'البريد الالكتروني يجب ان ينتهي ب .com';
                        }
                      },
                      controller: emailController)),
              Positioned(
                  top: 360,
                  right: 16,
                  left: 16,
                  child: CommonTextField(
                      title: 'كلمة المرور',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        }
                        //else if (value.length < 8) {
                        //  return 'password must be 8 characters or more';}
                      },
                      controller: passwordController)),
              Positioned(
                top: 450,
                right: 14,
                left: 200,
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page4()));},
                  child: const Text(
                    'نسيت كلمة المرور؟',
                    style: Styles.style20r,
                  ),
                ),
              ),
              Positioned(
                  top: 500,
                  right: 16,
                  left: 16,
                  child: CommonButton(
                      fun: () async {
                        SharedPreferences prefs;
                        prefs = await SharedPreferences.getInstance();
                        print( "${emailController.text}\n${passwordController.text}");
                        var login = await loginController(emailController.text, passwordController.text);
                        if (login == 1) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => computer(
                                    token: prefs
                                        .getString('token')
                                        .toString()),
                              ),
                                  (route) => false);
                        } else if (login == 0)
                        {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.topSlide,
                              title: "بيانات المستخدم غير صحيحة",
                              btnOkText: "حسنا",
                              btnOkOnPress: (){}
                          ).show();
                        } else
                        {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.topSlide,
                              title: "حدث خطأ ما، يرجى المحاولة مرة أخرى",
                              btnOkText: "حسنا",
                              btnOkOnPress: (){}
                          ).show();
                        }
                      },
                      buttonColor: mainGreen,
                      text: 'تسجيل الدخول')),
              Positioned(
                  top: 560,
                  left: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (const Page2())));},
                          child: const OmnesText(
                              text: ' انشاء حساب جديد', color: mainGreen)),
                      const SizedBox(
                        width: 5,
                      ),
                      const OmnesText(
                          text: ' ليس لديك حساب ؟ ', color: Colors.white)
                    ],
                  )),
              const Positioned(
                  top: 615, right: 16, left: 16, child: DividerComponent()),
              Positioned(
                  top: 653,
                  right: 16,
                  left: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoogleFacebookContainer(
                        text: 'فيسبوك',
                        logo: 'assets/pics/facebook.png',
                      ),
                      GoogleFacebookContainer(
                        text: 'جــــوجـل',
                        logo: 'assets/pics/google.png',
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );;
  }
}
