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
  // التحقق من إدخال جميع الحقول
  if (fatherName.isEmpty ||
      geniusName.isEmpty ||
      geniusAge.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      phone.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill in all fields')),
    );
    return;
  }

  try {
    // إعداد الطلب وإرسال البيانات
    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/register'), // استبدل بعنوان API الخاص بك
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

    // محاولة فك تشفير استجابة الخادم
    var responseBody;
    try {
      responseBody = jsonDecode(response.body);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Failed: Invalid response format')),
      );
      return;
    }

    // معالجة استجابة الخادم بناءً على رمز الحالة
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful')),
      );
    } else {
      if (responseBody is Map<String, dynamic> && responseBody.containsKey('error')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Failed: ${responseBody['error']}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Failed: Unexpected error: $responseBody')),
        );
      }
    }
  } catch (e) {
    // عرض رسالة خطأ للمستخدم في حالة حدوث استثناء
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration Failed: ${e.toString()}')),
    );
  }
}
