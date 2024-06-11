import 'package:aabkr/controllers/controllers/controllers.dart';
import 'package:aabkr/controllers/store_certificate.dart';
import 'package:aabkr/env_globals.dart';
import 'package:aabkr/model/quiz_model.dart';
import 'package:aabkr/views/components/common/face_widget.dart';
import 'package:aabkr/views/components/common/headline_text.dart';
import 'package:aabkr/views/components/common/main_button.dart';
import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:aabkr/views/components/common/waved_line.dart';
import 'package:aabkr/views/page27/page27_screen.dart';
import 'package:aabkr/views/quizAnswersPage/quiz_answers_page.dart';
import 'package:aabkr/views/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page18 extends StatefulWidget {
  Page18({super.key, required this.grade});
  double grade;

  @override
  State<Page18> createState() => _Page18State();
}

class _Page18State extends State<Page18> {
  @override
  Widget build(BuildContext context) {
    var paths = {
      "assets/pics/face_sunglasses.png": "😎 عبقري 😎",
      "assets/pics/face_heart-eyes.png": "😍 احسنت 😍",
      "assets/pics/face_big_eyes.png": "😃 جيد جداً 😃",
      "assets/pics/Smiling_face.png": "😊 لديك المزيد 😊",
      "assets/pics/Hugging_face.png": "🤗 حاول مرة اخرى 🤗",
    };
    int index;
    if (widget.grade == 100) {
      index = 0;
    } else if (widget.grade >= 90) {
      index = 1;
    } else if (widget.grade >= 70) {
      index = 2;
    } else if (widget.grade >= 50) {
      index = 3;
    } else {
      index = 4;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        title: const Center(child: HeadlineText(title: "نتيجه الاختبار")),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const WavedLine(),
            const SizedBox(height: 32),
            FaceWidget(facePath: paths.keys.elementAt(index)),
            const SizedBox(height: 20),
            ParagrahpText(txt: paths.values.elementAt(index), size: 36),
            const SizedBox(height: 5),
            HeadlineText(
              title: "${widget.grade.toStringAsFixed(1)}%",
              fsize: 96,
            ),
            MainButton(
              title: "شهادة المستوى",
              bcolor: Color(0xFF00DCEA),
              onpress: () async{
                String Usrname = await getUserCertName();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Page27(name: Usrname),));},
            ),
            const SizedBox(height: 24),
            MainButton(
              title: "مراجعة اجاباتك",
              onpress: () {for(QuizQuestion quest in answerdQuiz){print("q : ${quest.questionText} + A1 id : ${quest.answerOneId} -- A1 correct : ${quest.answerOneIsCorrect} + A1 id : ${quest.answerTwoId} -- A1 correct : ${quest.answerTwoIsCorrect}+ A1 id : ${quest.answerThreeId} -- A1 correct : ${quest.answerThreeIsCorrect} + userAnswer : ${quest.userSelectedAnswerId}");};
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuizAnswersPage(quizQuestions: answerdQuiz),
                    ));
              },
              padd: 25,
            ),
            const SizedBox(height: 24),
            MainButton(
                title: "إعادة الاختبار",
                bcolor: Color(0xFFFF5F84),
                onpress: () async{
                  var pref = await SharedPreferences.getInstance();
                  createTest(pref.getString('token').toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(quizQuestions: allQuestions),));
                  },
                padd: 35),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
