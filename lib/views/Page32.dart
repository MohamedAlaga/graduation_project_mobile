import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/png_button.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:flutter/material.dart';

class Lmore extends StatelessWidget {
  const Lmore({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PNG_button(
                    png_Logo: 'arrow_back .png',
                    png_widget: information(),
                  ),
                  SizedBox(
                    width: 38,
                  ),
                  stork_text(
                      w_sized: FontWeight.w700,
                      Y_offdet: 6,
                      Stext: 'تعلم اكثر عن الموضوع',
                      s_ctext: Colors.white,
                      sfamily: 'AA-GALAXY',
                      sT_Sized: 32),
                  SizedBox(
                    width: 68,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            S_Image(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Column(
                    children: [
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'الذكاء الصطناعي و تعلم الآلة🤖:تقدمت تقنيات الذكاء الاصطناعي بشكل كبير،حيث يستخدم التعلم الآلي في تطبيقات متنوعة ،من التشخيص الطبي الي تطوير السيارات الذاتية القيادة.',
                          ffamily: 'OMNES-ARABIC',
                          fsized: 20,
                          fcolor: Colors.black),
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'تكنولوجيا الاتصالات و الجيل الخماس 📡:شهدت تكنولوجيا الاتصالات تقدما سريعا،حيث يعد الجيل الخامس من شبكات الجوال خطوة ضخمة نحو سرعات أعلى و اتصال أكثر استقرارا.',
                          ffamily: 'OMNES-ARABIC',
                          fsized: 20,
                          fcolor: Colors.black),
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'الواقع الافتراضي و الواقع المعزز🕶️:أصبحت تقنيات الواقع الافتراضي و الواقع المعزز تحول تجاربنا اليومية،سواء في مجال الترفيةأو التعليم.',
                          fsized: 20,
                          ffamily: 'OMNES-ARABIC',
                          fcolor: Colors.black),
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'تطور الحوسبة الكموميه💻🔍:تعد الحسوبة الكمومية قفقزة هائلة في مجال الحوسبة،حيث تتيح لنا معالجة المعلومات بشكل ممتاز.',
                          ffamily: 'OMNES-ARABIC',
                          fcolor: Colors.black,
                          fsized: 20),
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'كما ان الاتجاه العام في العالم الحالي هو تعليم البرمجه للأطفال في سن صغير لكي يصبح متمكن منها جيدا.',
                          ffamily: 'OMNES-ARABIC',
                          fsized: 20,
                          fcolor: Colors.black),
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'كما ان السيد الرئيس وجه كلمته مشكورا الي الحكومه بضروره الاهتمام بالجانب الحوسبي و قد قتم سيادته بالعديدمن الزيارات لابنلئنا الطلاب في جميع المراحل العمريه للتنويه علي مدي اهميه الموضوع ولذلك له جزيل الشكر و التقدير.',
                          ffamily: 'OMNES-ARABIC',
                          fsized: 20,
                          fcolor: Colors.black),
                      C_Text(
                          w_font: FontWeight.w600,
                          text:
                              'كما و قام الدكتر احمد العشري بالكثير من الابحاث و المجهود لكي يوضح لابنائه الطلبه مدي اهميه الموضوع و لديه له منا كل تقجير و الاحترام فهو كالاب قبل المعلم.',
                          ffamily: 'OMNES-ARABIC',
                          fsized: 20,
                          fcolor: Colors.black),
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 68),
                            child: button(
                                b_border: 14,
                                bHieght: 48,
                                bWidth: 130,
                                bText: 'السابق',
                                bcolor: Color.fromARGB(255, 255, 95, 132),
                                b_fun: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => information()),
                                  );
                                },
                                bF_Text: 32),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          button(
                              b_border: 14,
                              bHieght: 48,
                              bWidth: 130,
                              bText: 'التالي',
                              bcolor: Color.fromARGB(255, 31, 204, 123),
                              b_fun: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => information()),
                                );
                              },
                              bF_Text: 32)
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
