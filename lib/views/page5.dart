import 'package:aabkr/views/components/common/face_widget.dart';
import 'package:aabkr/views/components/common/main_button.dart';
import 'package:aabkr/views/components/common/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:aabkr/views/components/common/headline_text.dart';

class Page5 extends StatelessWidget {
  Page5({super.key});
  final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const HeadlineText(
                title: "التحقق",
              ),
              const SizedBox(
                height: 32,
              ),
              const FaceWidget(
                facePath: "assets/pics/thinking_face.png",
                cover: "assets/pics/thinking_face_cover.svg",
              ),
              const SizedBox(height: 37),
              const ParagrahpText(
                txt: "ادخل كود التحقق الذي تم",
                size: 32,
              ),
              const ParagrahpText(
                txt: "ارساله لك الأن",
                size: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: MainTextField(
                  title: "كود التفعيل",align: Alignment.bottomCenter,txtcontroller: controller,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              const ParagrahpText(
                txt: "اذا لم تكن استلمت الكود! ",
                size: 18,
              ),
              const ParagrahpText(txt: "إعادة الارسال", size: 18),
              const SizedBox(height: 26),
               const MainButton(
                title: "التالي",
                padd: 33,
              )
            ],
          ),
        ),
      )),
    );
  }
}