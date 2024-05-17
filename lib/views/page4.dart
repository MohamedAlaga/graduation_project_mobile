import 'package:aabkr/controllers/send_pass_reset_mail.dart';
import 'package:aabkr/views/components/common/face_widget.dart';
import 'package:aabkr/views/components/common/headline_text.dart';
import 'package:aabkr/views/components/common/main_button.dart';
import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:aabkr/views/components/common/main_text_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  Page4({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              const HeadlineText(title: "نسيت كلمة المرور"),
              const SizedBox(
                height: 20,
              ),
              const FaceWidget(
                facePath: "assets/pics/Disappointed_face.png",
                cover: "assets/pics/forget_pass_cover.svg",
              ),
              const SizedBox(
                height: 40,
              ),
              const ParagrahpText(
                txt: "ادخل بريدك الالكتروني",
                size: 32,
              ),
              const ParagrahpText(
                txt: "الذي سجلت به في المنصة",
                size: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              const ParagrahpText(
                txt: "سوف نرسل لك رسالة لإعادة تعين كلمة مرورك",
                size: 18,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: MainTextField(
                    title: "البريد الالكتروني", txtcontroller: controller),
              ),
              const SizedBox(
                height: 40,
              ),
              MainButton(
                title: "التالي",
                padd: 33,
                onpress: ()  async{var resetValue =  await passResetEmailSender(controller.text);
                  if (resetValue == true && context.mounted){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.topSlide,
                      title: 'تم ارسال رسالة لإعادة تعيين كلمة المرور',
                      btnOkText: "حسنا",
                      btnOkOnPress: () {
                        Navigator.maybePop(context);
                      },
                    ).show();
                  } else if (resetValue == false && context.mounted){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.topSlide,
                      title: 'البريد الالكتروني غير موجود',
                      btnOkOnPress: () {
                        Navigator.maybePop(context);
                      },
                    ).show();
                  }
                  else if (context.mounted)
                  {{AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.topSlide,
                      title: "حدث خطأ ما",
                      btnOkOnPress: () {
                        Navigator.maybePop(context);
                      },
                    ).show();}
                  }
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
