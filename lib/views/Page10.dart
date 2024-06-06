import 'package:aabkr/controllers/checkPass.dart';
import 'package:aabkr/views/Page12.dart';
import 'package:aabkr/views/Page23.dart';
import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/dialog_button.dart';
import 'package:aabkr/views/components/common/png_button.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:aabkr/views/components/common/setting_dialoge.dart';
import 'package:aabkr/views/components/common/svg_button.dart';
import 'package:aabkr/views/page25.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// repalce information widget
class computer extends StatelessWidget {
  computer({super.key, required this.token});
  final String token;
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: S_Image(),
        ),
        leading: Column(
          children: [
            const SizedBox(height: 7),
            PNG_button(
                png_Logo: 'Gear.png',
                func: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingDialoge(
                          buttons: DialogButton(
                            title: "الدخول الي الاعدادات",
                            func: () async {
                              int pass =
                                  await checkPassController(control.text);
                              control.text = '';
                              if (pass == 1) {
                                Navigator.pop(context);
                                var prefs =
                                    await SharedPreferences.getInstance();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Page25(
                                          token: prefs
                                              .getString('token')
                                              .toString())),
                                );
                              } else if (pass == 0) {
                                       AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.topSlide,
                                          title: "بيانات المستخدم غير صحيحة",
                                          btnOkText: "حسنا",
                                          btnOkOnPress: () {}).show();
                              } else {AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.topSlide,
                                            title: "حدث خطأ ما، يرجى المحاولة مرة أخرى",
                                            btnOkText: "حسنا",
                                            btnOkOnPress: (){}
                                          ).show();}
                            },
                          ),
                          controler: control,
                        );
                      });
                }),
            const SizedBox(
              height: 1,
            ),
            const C_Text(
                w_font: FontWeight.w700,
                text: 'الاعدادات',
                ffamily: 'OMNES-ARABIC',
                fsized: 11,
                fcolor: Color.fromARGB(255, 234, 159, 63)),
          ],
        ),
        title: const stork_text(
            w_sized: FontWeight.w700,
            Y_offdet: 6,
            Stext: 'عبقر',
            s_ctext: Color.fromARGB(255, 255, 210, 0),
            sfamily: 'AlaTypoo',
            sT_Sized: 36),
        actions: const [
          Column(
            children: [
              SizedBox(height: 7),
              SVG_button(svg_Logo: 'Frame 43.svg', svg_widget: community()),
              SizedBox(
                height: 1,
              ),
              C_Text(
                  w_font: FontWeight.w700,
                  text: 'المجتمع',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 11,
                  fcolor: Color.fromARGB(255, 234, 159, 63)),
            ],
          )
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        surfaceTintColor: Colors.transparent,
        elevation: 10,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const stork_text(
                      w_sized: FontWeight.w700,
                      Stext: 'انا الكمبيوتر',
                      Y_offdet: 6,
                      s_ctext: Colors.white,
                      sfamily: 'AA-GALAXY',
                      sT_Sized: 36),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: C_Text(
                        w_font: FontWeight.w600,
                        text:
                            'هو كــورس عن تـــاريخ الكمبيوتر بشكل بـســيط وممتع، يقدمه لكم ثمانية أصدقاء مبرمجين',
                        ffamily: 'OMNES-ARABIC',
                        fsized: 20,
                        fcolor: Colors.black),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Center(
                    child: C_Text(
                        w_font: FontWeight.w700,
                        text: '🌟 فصول الكورس 🌟',
                        ffamily: 'OMNES-ARABIC',
                        fsized: 20,
                        fcolor: Colors.black),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: '  مراجعة ممتعة عن تطور التكنولوجيا ⭐',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: ' شرح مكونات الكمبيوتر ونظام التشغيل ⭐',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: ' شرح واجهة الكمبيوتر وكيفية التحكم به ⭐',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: ' شرح الانترنت والشبكات والفرق بينهم ⭐',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: ' خطر الانترنت وكيفة حماية نفسك منه ⭐',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: ' كيف تبحث عن حلول فعالة للمشكلات ⭐',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 18,
                  ),
                  const C_Text(
                      w_font: FontWeight.w600,
                      text: ' مقدمة عن البرمجة الحديثة وأساسياتها ⭐ ',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 20,
                      fcolor: Colors.black),
                  const SizedBox(
                    height: 45,
                  ),
                  button(
                    bText: ' التالي   ',
                    bcolor: const Color.fromRGBO(31, 204, 123, 1),
                    b_fun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => V_List()),
                      );
                    },
                    bF_Text: 32,
                    bHieght: 48,
                    bWidth: 156,
                    b_border: 14,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
