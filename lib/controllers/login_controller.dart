import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Logs the user into the system.
///
/// Sends a POST request to the server with the provided email and password to authenticate the user.
///
/// Parameters:
///   - email: The email of the user.
///   - password: The password of the user.
///
/// Returns:
///   - A JSON string containing an access token if login is successful.
///   - A JSON string containing an error message if login fails.

loginController(String email, String password) async {
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  if(email.isNotEmpty && password.isNotEmpty){
  try {
    var response = await http.post(
      Uri.parse(
        '$domainName/api/login',
      ),
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'host': "10.2.2.2:8000"
      },
    ).timeout(const Duration(seconds: 10));
    var responseBody = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return -1;
    }
    if (responseBody['access_token'] != null) {
      prefs.setString('token', responseBody['access_token']);
      return 1;
    } else if (responseBody['error'] == 'Unauthorized') {
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
