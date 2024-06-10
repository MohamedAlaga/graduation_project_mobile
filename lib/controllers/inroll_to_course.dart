import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

inrollToCourse() async {
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token').toString();
  try {
    var response = await http.post(
      Uri.parse(
        '$domainName/api/courses/1/enroll',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'host': "10.2.2.2:8000",
        'Authorization': 'Bearer $token',
      },
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      print(response.statusCode);
      return -1;
    }
    var responseBody = jsonDecode(response.body);
    if (responseBody['success'] == true) {
      print(responseBody['message']);
      return 1;
    } else {
      print(responseBody['success'].toString());
      return 0;
    }
  } catch (e) {
    return 0;
  }

}