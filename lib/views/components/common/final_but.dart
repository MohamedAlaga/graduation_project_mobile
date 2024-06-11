import 'package:aabkr/controllers/controllers/controllers.dart';
import 'package:aabkr/env_globals.dart';
import 'package:aabkr/model/quiz_model.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/page15.dart';
import 'package:aabkr/views/page18_22.dart';
import 'package:aabkr/views/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class finB_tam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 328,
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            button(
                b_border: 20,
                bHieght: 56,
                bWidth: 328,
                bText: 'الاختبار النهائي 🤔',
                bcolor: const Color.fromARGB(255, 255, 210, 0),
                b_fun: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Page18(grade: percentage,),));
                },
                bF_Text: 28),
            Positioned(
                height: 50,
                width: 50,
                top: -12,
                right: -12,
                child: Container(
                  alignment: Alignment.topRight,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 210, 0),
                      boxShadow: [
                        BoxShadow(color: Colors.black, offset: Offset(0, 4))
                      ]),
                  child: C_Text(
                      w_font: FontWeight.w600,
                      text: '✔  ',
                      ffamily: 'OMNES-ARABIC',
                      fsized: 32,
                      fcolor: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}


class finB_msht extends StatelessWidget {
  final bool isEnabled;
  const finB_msht({super.key, required this.isEnabled});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 56,
        width: 328,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            button(fcolor: isEnabled? Colors.white: Color.fromARGB(255, 194, 193, 192),
                b_border: 20,
                bHieght: 56,
                bWidth: 328,
                bText: 'الاختبار النهائي 🤔',
                bcolor: isEnabled ?Color.fromARGB(255, 255, 210, 0) : Color.fromARGB(255, 148, 128, 37),
                b_fun: isEnabled ? () async {
                  var prefs = await SharedPreferences.getInstance();
                  String token = prefs.getString('token').toString();
                  var test = await createTest(token);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(
                              quizQuestions: test,
                            )),
                  );
                }:(){},
                bF_Text: 28),
            Positioned(
                height: 50,
                width: 50,
                top: -12,
                right: -12,
                child: Container(
                  alignment: Alignment.topRight,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                      color:isEnabled ? Color.fromARGB(255, 255, 210, 0) : Color.fromARGB(255, 148, 128, 37),
                      ),
                  
                ))
          ],
        ),
      ),
    );
  }
}

class FCondition extends StatelessWidget {
  final bool value;
  final bool isEnabled;

  const FCondition({required this.value, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    if (value == false) {
      return finB_msht( isEnabled: isEnabled,);
    } else {
      return finB_tam();
    }
  }
}
