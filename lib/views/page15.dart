import 'package:aabkr/controllers/controllers/controllers.dart';
import 'package:aabkr/model/quiz_model.dart';
import 'package:aabkr/views/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/common/headline_text.dart';
import 'components/common/paragraph_text.dart';
import 'components/common/main_button.dart';
import 'components/common/face_widget.dart';
import 'components/common/waved_line.dart';

class Page15 extends StatelessWidget {
  const Page15({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        centerTitle: true,
        title: const HeadlineText(title: "اختبر معلوماتك"),
      ),
      body:  Column(
        children: [
           const WavedLine(),
           const SizedBox(
            height: 30,
          ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const FaceWidget(facePath:"assets/pics/nerd_face.png"),
                  const SizedBox(height: 35),
                  const ParagrahpText(txt:"اختبار بسيط لمعلوماتك علي المسلسل"),
                  const ParagrahpText(txt:"بالكامل من البداية الي النهاية"),
                  const SizedBox(height: 20),
                  const ParagrahpText(txt:"مكون من 20 سؤال بسيط"),
                  const ParagrahpText(txt:"يمكنك اعادة الاختبار اكثر من مره"),
                  const SizedBox(height: 20),
                  const ParagrahpText(txt:"😊 لا يوجد وقت للانهاء 😊"),
                  const SizedBox(height: 50),
                 MainButton(title:"اذهب للاختبار",onpress: () async {
                  var prefs = await SharedPreferences.getInstance();
                  String token = prefs.getString('token').toString();
                  List<QuizQuestion> test = await createTest(token);
                  print(test[0].questionText);
                  print(test[1].questionText);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(
                              quizQuestions: test,
                            )),
                  );
                },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






