import 'dart:convert';

import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;

gooleAuthContoler() async {
  try {
    var response = await http.post(
      Uri.parse(
        '$domainName/api/auth/google',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    if (responseBody['message'] != null) {
      return 1;
    }  else {
      print(responseBody);
      return 0;
    }
    } else {
      print(response.body.toString());
      return 0;
    }
  } catch (e) {
    return 0;
  }
}