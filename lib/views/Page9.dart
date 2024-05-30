import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/button_image.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/my_text_filed.dart';
import 'package:aabkr/views/components/common/password_TextFiled.dart';
import 'package:flutter/material.dart';

class information extends StatelessWidget {
  information({super.key});
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _geniusNameController = TextEditingController();
  final TextEditingController _geniusAgeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
//  @override
//   void dispose() {
//     _fatherNameController.dispose();
//     _geniusNameController.dispose();
//     _geniusAgeController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _phoneController.dispose();

//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                stork_text(
                  Y_offdet: 6,
                  w_sized: FontWeight.w700,
                  Stext: 'بياناتك',
                  s_ctext: Colors.white,
                  sfamily: 'AA-GALAXY',
                  sT_Sized: 36,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                  child: my_text_filed(
                      controller: _fatherNameController, h_text: 'اسم الوالد'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                  child: my_text_filed(
                      controller: _geniusNameController, h_text: 'اسم العبقري'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                  child: my_text_filed(
                      controller: _geniusAgeController, h_text: 'سن العبقري'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 2),
                  child: my_text_filed(
                      controller: _emailController,
                      h_text: 'البريد الالكتروني'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                  child: PasswordField(controller: _passwordController),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                  child: my_text_filed(
                      controller: _phoneController, h_text: 'رقم الهاتف'),
                ),
                SizedBox(
                  height: 46,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: button(
                    bText: 'انشاء حساب جديد',
                    bcolor: Color.fromRGBO(31, 204, 123, 1),
                    //bwidget: create(),
                    b_fun: () {
                      // register(
                      //   context: context,
                      //   email: _emailController.text,
                      //   fatherName: _fatherNameController.text,
                      //   geniusAge: _geniusAgeController.text,
                      //   geniusName: _geniusNameController.text,
                      //   password: _passwordController.text,
                      //   phone: _phoneController.text,
                      // );
                    },
                    bF_Text: 32,
                    bHieght: 56,
                    bWidth: double.infinity,
                    b_border: 14,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: stork_text(
                      Y_offdet: 4,
                      w_sized: FontWeight.w600,
                      Stext: 'تسجيل الدخول',
                      s_ctext: Color.fromARGB(255, 31, 204, 123),
                      sfamily: 'OMNES-ARABIC',
                      sT_Sized: 20,
                    )),
                    stork_text(
                      Y_offdet: 4,
                      w_sized: FontWeight.w600,
                      Stext: 'هل لديك حساب علي عبقر ؟',
                      s_ctext: Colors.white,
                      sfamily: 'OMNES-ARABIC',
                      sT_Sized: 20,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                C_Text(
                    w_font: FontWeight.w600,
                    text: '_____________او الدخول باستخدام _____________',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 16,
                    fcolor: Color.fromARGB(255, 163, 163, 163)),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: button_image(
                        nImage: 'logos_facebook.svg',
                        nText: 'فيسبوك',
                        b_border: 14,
                        bcolor: Color.fromARGB(255, 255, 95, 132),
                        nhight: 48,
                        nwidth: 180,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                      ),
                      child: button_image(
                        nImage: 'devicon_google.svg',
                        nText: 'جــــوجـل',
                        b_border: 14,
                        bcolor: Color.fromARGB(255, 255, 95, 132),
                        nhight: 48,
                        nwidth: 180,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
