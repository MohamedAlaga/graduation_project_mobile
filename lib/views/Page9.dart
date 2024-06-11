import 'package:aabkr/controllers/user_info.dart';
import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'package:aabkr/views/commonComponents/omnes_text.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/button_image.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/my_text_filed.dart';
import 'package:aabkr/views/components/common/password_TextFiled.dart';
import 'package:aabkr/views/page3/page3_screen.dart';
import 'package:flutter/material.dart';

class information extends StatelessWidget {
  information({super.key});
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _geniusNameController = TextEditingController();
  final TextEditingController _geniusAgeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fatherNameController.dispose();
    _geniusNameController.dispose();
    _geniusAgeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const stork_text(
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
                      controller: _fatherNameController,
                      h_text: 'اسم الوالد',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال اسم الوالد';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                    child: my_text_filed(
                      controller: _geniusNameController,
                      h_text: 'اسم العبقري',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال اسم العبقري';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                    child: my_text_filed(
                      controller: _geniusAgeController,
                      h_text: 'سن العبقري',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال سن العبقري';
                        }
                        if (int.tryParse(value) == null) {
                          return 'يرجى إدخال رقم صالح';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 2),
                    child: my_text_filed(
                      controller: _emailController,
                      h_text: 'البريد الالكتروني',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال البريد الإلكتروني';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'يرجى إدخال بريد إلكتروني صالح';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                    child: PasswordField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمة المرور';
                        }
                        if (value.length < 6) {
                          return 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 2),
                    child: my_text_filed(
                      controller: _phoneController,
                      h_text: 'رقم الهاتف',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال رقم الهاتف';
                        }
                        if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                          return 'يرجى إدخال رقم هاتف صالح';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: button(
                      bText: 'انشاء حساب جديد',
                      bcolor: const Color.fromRGBO(31, 204, 123, 1),
                      b_fun: () {
                        if (_formKey.currentState!.validate()) {
                          register(
                            context: context,
                            email: _emailController.text,
                            fatherName: _fatherNameController.text,
                            geniusAge: _geniusAgeController.text,
                            geniusName: _geniusNameController.text,
                            password: _passwordController.text,
                            phone: _phoneController.text,
                          );
                        }
                      },
                      bF_Text: 32,
                      bHieght: 56,
                      bWidth: double.infinity,
                      b_border: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page3(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const OmnesText(
                          text: 'تسجيل الدخول',
                          color: mainGreen,
                        ),
                      ),
                      const stork_text(
                        Y_offdet: 4,
                        w_sized: FontWeight.w600,
                        Stext: 'هل لديك حساب علي عبقر ؟',
                        s_ctext: Colors.white,
                        sfamily: 'OMNES-ARABIC',
                        sT_Sized: 20,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const C_Text(
                    w_font: FontWeight.w600,
                    text: '_____________او الدخول باستخدام _____________',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 16,
                    fcolor: Color.fromARGB(255, 163, 163, 163),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: button_image(
                          nImage: 'logos_facebook.svg',
                          nText: 'فيسبوك',
                          b_border: 14,
                          bcolor: Color.fromARGB(255, 255, 95, 132),
                          nhight: 48,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: button_image(
                          nImage: 'devicon_google.svg',
                          nText: 'جــــوجـل',
                          b_border: 14,
                          bcolor: Color.fromARGB(255, 255, 95, 132),
                          nhight: 48,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}