import 'dart:convert';
import 'package:aabkr/controllers/handle_user_data_update.dart';
import 'package:aabkr/controllers/logout_controller.dart';
import 'package:aabkr/views/page3/page3_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:aabkr/controllers/get_user_data.dart';
import 'package:aabkr/views/components/common/back_button.dart';
import 'package:aabkr/views/components/common/headline_text.dart';
import 'package:aabkr/views/components/common/main_button.dart';
import 'package:aabkr/views/components/common/main_text_field.dart';
import 'package:aabkr/views/components/common/waved_line.dart';
import 'package:aabkr/views/components/settings/circular_btn_with_txt.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page25 extends StatelessWidget {
  Page25({super.key, required this.token});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final String token;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserDate(token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var userData = jsonDecode(snapshot.data.toString());
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 255, 250, 237),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 255, 250, 237),
                title: const HeadlineText(title: "الأعدادات"),
                leading: const ImageBackButton(),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const WavedLine(
                          link: "assets/pics/app_bar_line_green.png",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 16.0, left: 16.0, right: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MainTextField(
                                  title: "اسم العبقري",
                                  txtcontroller: nameController,
                                  text: userData["name"]),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: MainTextField(
                                    title: "اسمك",
                                    txtcontroller: lNameController,
                                    text: userData["father_name"]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: MainTextField(
                                    title: "سن العبقري",
                                    txtcontroller: ageController,
                                    text: userData["age"]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: MainTextField(
                                    title: "البريد الالكتروني",
                                    txtcontroller: emailController,
                                    text: userData["email"]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: MainTextField(
                                    title: " كلمة المرور الجديده",
                                    txtcontroller: passController,
                                    isPass: true),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: MainTextField(
                                    title: "تأكيد كلمة المرور",
                                    txtcontroller: confirmPassController,
                                    isPass: true),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: MainTextField(
                                    title: "رقم الهاتف",
                                    txtcontroller: phoneController,
                                    text: userData["phone"]),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainButton(
                                      title: "الغاء",
                                      bcolor: const Color(0xFFF9295A),
                                      onpress: () {
                                        Navigator.maybePop(context);
                                      },
                                    ),
                                    MainButton(
                                      title: "حفظ",
                                      onpress: () async {
                                        var update = await handleUserDataUpdate(
                                            nameController.text,
                                            lNameController.text,
                                            ageController.text,
                                            emailController.text,
                                            passController.text,
                                            confirmPassController.text,
                                            phoneController.text,
                                            token);
                                        if (update["success"] == false &&
                                            context.mounted) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.topSlide,
                                            title: update["message"],
                                            btnOkText: "حسنا",
                                            btnOkOnPress: () {
                                              Navigator.maybePop(context);
                                            },
                                          ).show();
                                          return;
                                        } else if (update["success"] == true &&
                                            context.mounted) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.topSlide,
                                            title: update["message"],
                                            btnOkText: "حسنا",
                                            btnOkOnPress: () {
                                              Navigator.maybePop(context);
                                            },
                                          ).show();
                                        } else if (context.mounted) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.topSlide,
                                            title: "حدث خطأ ما",
                                            btnOkText: "حسنا",
                                            btnOkOnPress: () {
                                              Navigator.maybePop(context);
                                            },
                                          ).show();
                                        }
                                      },
                                    )
                                  ]),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                   CircularBtnWithTxt(
                                    path: "assets/pics/trash.svg",
                                    txt: "حذف الحساب",
                                    onpress: (){},
                                  ),
                                  CircularBtnWithTxt(
                                    path: "assets/pics/logout.svg",
                                    txt: "تسجيل الخروج",
                                    onpress: () async {
                                      SharedPreferences prefs;
                                      prefs =
                                          await SharedPreferences.getInstance();
                                      var logout = await logoutController(
                                          prefs.getString('token').toString());
                                      if (logout == 1) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     Page3()),
                                            (route) => false);
                                      } else {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.topSlide,
                                          title: "حدث خطأ ما",
                                          btnOkText: "حسنا",
                                          btnOkOnPress: () {},
                                        ).show();
                                      }
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }
      },
    );
  }
}
