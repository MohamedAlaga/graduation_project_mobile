import 'package:aabkr/views/Page23.dart';
import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/png_button.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:aabkr/views/components/common/svg_button.dart';
import 'package:flutter/material.dart';

// repalce information widget
class computer extends StatelessWidget {
  const computer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        PNG_button(
                            png_Logo: 'Gear.png', png_widget: information()),
                        SizedBox(
                          height: 1,
                        ),
                        C_Text(
                            w_font: FontWeight.w700,
                            text: 'الاعدادات',
                            ffamily: 'OMNES-ARABIC',
                            fsized: 11,
                            fcolor: Color.fromARGB(255, 234, 159, 63)),
                      ],
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    C_Text(
                        w_font: FontWeight.w600,
                        text: '<',
                        ffamily: 'AlaTypoo',
                        fsized: 36,
                        fcolor: Color.fromARGB(255, 0, 0, 0)),
                    stork_text(
                        w_sized: FontWeight.w700,
                        Y_offdet: 6,
                        Stext: 'عبقر',
                        s_ctext: Color.fromARGB(255, 255, 210, 0),
                        sfamily: 'AlaTypoo',
                        sT_Sized: 36),
                    C_Text(
                        w_font: FontWeight.w600,
                        text: '>',
                        ffamily: 'AlaTypoo',
                        fsized: 36,
                        fcolor: Color.fromARGB(255, 0, 0, 0)),
                    SizedBox(
                      width: 115,
                    ),
                    Column(
                      children: [
                        SVG_button(
                            svg_Logo: 'Frame 43.svg', svg_widget: community()),
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
                    ),
                  ],
                ),
              ),
              S_Image(),
              SizedBox(
                height: 20,
              ),
              stork_text(
                  w_sized: FontWeight.w700,
                  Stext: 'انا الكمبيوتر',
                  Y_offdet: 6,
                  s_ctext: Colors.white,
                  sfamily: 'AA-GALAXY',
                  sT_Sized: 36),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: C_Text(
                    w_font: FontWeight.w600,
                    text:
                        'هو كــورس عن تـــاريخ الكمبيوتر بشكل بـســيط وممتع، يقدمه لكم ثمانية أصدقاء مبرمجين',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 20,
                    fcolor: Colors.black),
              ),
              SizedBox(
                height: 28,
              ),
              Center(
                child: C_Text(
                    w_font: FontWeight.w700,
                    text: '🌟 فصول الكورس 🌟',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 20,
                    fcolor: Colors.black),
              ),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐  مراجعة ممتعة عن تطور التكنولوجيا',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐ شرح مكونات الكمبيوتر ونظام التشغيل',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐ شرح واجهة الكمبيوتر وكيفية التحكم به',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐شرح الانترنت والشبكات والفرق بينهم',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐ خطر الانترنت وكيفة حماية نفسك منه',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐ كيف تبحث عن حلول فعالة للمشكلات ',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '⭐ مقدمة عن البرمجة الحديثة وأساسياتها  ',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 45,
              ),
              button(
                bText: ' التالي   ',
                bcolor: Color.fromRGBO(31, 204, 123, 1),
                b_fun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => information()),
                  );
                },
                bF_Text: 32,
                bHieght: 48,
                bWidth: 156,
                b_border: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
