import 'package:flutter/material.dart';
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
      body: const Column(
        children: [
           WavedLine(),
            SizedBox(
            height: 30,
          ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 FaceWidget(facePath:"assets/pics/nerd_face.png"),
                  SizedBox(height: 35),
                  ParagrahpText(txt:"اختبار بسيط لمعلوماتك علي المسلسل"),
                  ParagrahpText(txt:"بالكامل من البداية الي النهاية"),
                  SizedBox(height: 20),
                  ParagrahpText(txt:"مكون من 20 سؤال بسيط"),
                  ParagrahpText(txt:"يمكنك اعادة الاختبار اكثر من مره"),
                  SizedBox(height: 20),
                  ParagrahpText(txt:"😊 لا يوجد وقت للانهاء 😊"),
                  SizedBox(height: 50),
                 MainButton(title:"اذهب للاختبار"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






