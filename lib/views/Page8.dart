import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';

import 'Page9.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: [
              SizedBox(
                height: 46,
              ),
              stork_text(
                  w_sized: FontWeight.w700,
                  Y_offdet: 6,
                  Stext: 'اهلا بك في عبقر',
                  s_ctext: Colors.white,
                  sfamily: 'AA-GALAXY',
                  sT_Sized: 36),
              SizedBox(
                height: 32,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text:
                      'منصة عبقر هي منصة تعليم برمجة للأطفال و الشباب بـطـريقـة ترفيهية وأساليب حديثة ',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 32,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text: '.تنقسم المنصة الي قسمين أساسيين ',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 32,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text:
                      '.القسم الأول : وهو مخصص لفئة (6 - 12)  ويعد تمهيد للعبقري ليتعرف  علي تاريخ الكمبيوتر منذ بدايته وصولاً الي البرمجة وتطورها ، في شكل كورس ترفيهي ومنظم ',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text:
                      '🤩 😎بنهاية هذ القسم يكون قد عرف العبقري تاريخ البرمجة وتعلم اساسيات البرمجة بشكل متقن ، دون تعقيد او ملل',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                  w_font: FontWeight.w600,
                  text:
                      '.لا يشترط ان يتجاوز العبقري سن 12 ليصل الي القسم الثاني ، فبمجرد ان ينتهي من القسم الأول بنجاح ، يصعد تلقائياً الي القسم الثاني',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black),
              SizedBox(
                height: 24,
              ),
              C_Text(
                w_font: FontWeight.w600,
                text:
                    '.القسم الثاني:وهو مخصص لفئة(13-18)ويعد البداية لتعليم البرمجة المتظورة للعبقري بعدما تم تأسيسه في المستوي الأول',
                ffamily: 'OMNES-ARABIC',
                fsized: 20,
                fcolor: Colors.black,
              ),
              SizedBox(
                height: 46,
              ),
              button(
                  b_border: 14,
                  bHieght: 48,
                  bWidth: 156,
                  bText: 'التالي',
                  bcolor: Color.fromRGBO(31, 204, 123, 1),
                  b_fun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => information()),
                    );
                  },
                  bF_Text: 34),
            ],
          ),
        ),
      ),
    );
  }
}
