import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

getUserCertName() async {
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token').toString();
  try {
    var response = await http.post(
      Uri.parse(
        '$domainName/api/certificate',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      return -1;
    }
    var responseBody = jsonDecode(response.body);
    if (responseBody['success'] == true) {
      return responseBody['data']['name'];
    } else {
      return " Student Name";
    }
  } catch (e) {
    return "request failed";
  }

}