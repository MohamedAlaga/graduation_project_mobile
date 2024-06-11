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

logoutController(String token) async {
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  if(token.isNotEmpty){
  try {
    var response = await http.post(
      Uri.parse(
        '$domainName/api/logout',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    if (responseBody['message'] != null) {
        prefs.remove('token');
      return 1;
    }  else {
      return 0;
    }
    } else {
      return 0;
    }
  } catch (e) {
    return 0;
  }
  } else {
    return 0;
  }
}