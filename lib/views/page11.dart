import 'package:aabkr/views/components/common/face_widget.dart';
import 'package:aabkr/views/components/common/headline_text.dart';
import 'package:aabkr/views/components/common/main_button.dart';
import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:flutter/material.dart';

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        centerTitle: true,
        title: const HeadlineText(title: "جاري العمل عليه"),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 60,
          ),
          const FaceWidget(facePath: "assets/pics/Hourglass.png"),
          const SizedBox(
            height: 60,
          ),
          const ParagrahpText(txt: "سيتم  إضافة قسم ( 18 - 13 ) "),
          const ParagrahpText(txt: "في  التحديث  القادم"),
          const SizedBox(
            height: 75,
          ),
          MainButton(
            title: "رجوع",
            padd: 70,
            onpress: () {
              Navigator.maybePop(context);
            },
          ),
        ]),
      ),
    );
  }
}
