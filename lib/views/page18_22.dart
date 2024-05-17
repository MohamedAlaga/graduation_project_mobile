import 'package:aabkr/views/components/common/face_widget.dart';
import 'package:aabkr/views/components/common/headline_text.dart';
import 'package:aabkr/views/components/common/main_button.dart';
import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:aabkr/views/components/common/waved_line.dart';
import 'package:flutter/material.dart';

class Page18 extends StatelessWidget {
  const Page18({super.key, required this.grade});
  final int grade;
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
    if (grade == 100) {
      index = 0;
    } else if (grade >= 90) {
      index = 1;
    } else if (grade >= 70) {
      index = 2;
    } else if (grade >= 50) {
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
            const SizedBox(height: 40),
            ParagrahpText(txt: paths.values.elementAt(index), size: 36),
            const SizedBox(height: 40),
            HeadlineText(title: "$grade%",fsize:96 ,),
             const MainButton(title: "شهادة المستوى",bcolor: Color(0xFF00DCEA),),
            const SizedBox(height: 24),
             const MainButton(title: "مراجعة اجاباتك",)
             ,const SizedBox(height: 48)
          ],
        ),
      ),
    );
  }
}
