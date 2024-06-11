import 'package:aabkr/env_globals.dart';
import 'package:aabkr/views/page3/page3_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> register({
  required BuildContext context,
  required String fatherName,
  required String geniusName,
  required String geniusAge,
  required String email,
  required String password,
  required String phone,
}) async {
  if (fatherName.isEmpty ||
      geniusName.isEmpty ||
      geniusAge.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      phone.isEmpty) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      desc: 'من فضلك املأ جميع الحقول',
      btnOkOnPress: () {},
    ).show();
    return;
  }

  try {
    var response = await http.post(
      Uri.parse('$domainName/api/register'),
      body: jsonEncode(<String, String>{
        'father_name': fatherName,
        'name': geniusName,
        'age': geniusAge,
        'email': email,
        'password': password,
        'phone': phone,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var responseBody;
    try {
      responseBody = jsonDecode(response.body);
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        desc: 'حدث خطأ غير متوقع: $e',
        btnOkOnPress: () {},
      ).show();
      return;
    }

    // معالجة استجابة الخادم بناءً على رمز الحالة
    if (response.statusCode == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        desc: 'تم تسجيل الحساب بنجاح',
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Page3(),
              ),
              (route) => false);
        },
      ).show();
    } else {
      if (responseBody is Map<String, dynamic> &&
          responseBody.containsKey('error')) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          desc: 'حدث خطأ غير متوقع: ${responseBody['error']}',
          btnOkOnPress: () {},
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          desc: 'حدث خطأ غير متوقع: $responseBody',
          btnOkOnPress: () {},
        ).show();
      }
    }
  } catch (e) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      desc: 'حدث خطأ غير متوقع: $e',
      btnOkOnPress: () {},
    ).show();
  }
}
