
import 'dart:convert';
import 'package:aabkr/env_globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

checkPassController(String password) async {
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  String ? token = prefs.getString('token');
  if(token == null){
    return -1;
  }
  if( password.isNotEmpty){
  try {
    var response = await http.post(
      Uri.parse(
        '$domainName/api/user/password/check',
      ),
      body: jsonEncode(<String, String>{ 'password': password}),
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
    var responseBody = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return -1;
    }
    if (responseBody['success'] == true) {
      return 1;
    } else if (responseBody['success'] == false) {
      return 0;
    } else {
      return -1;
    }
  } catch (e) {
    return -1;
  }
  } else {
    return -1;
  }
}