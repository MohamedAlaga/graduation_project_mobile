import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

loginController(String email, String password) async {
  var response = await http.post(
    Uri.parse(
      'http://127.0.0.1/api/login',
    ),
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
    headers: <String, String>{
      'User-Agent': 'mobileApp',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'host': "127.0.0.1:8000"
    },
  ).timeout(const Duration(seconds: 10));
  var responseBody = jsonDecode(response.body);

  if (responseBody['access_token'] != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email); // Save email
    prefs.setString('token', responseBody['access_token']); // Save token
  } else {
    return responseBody['error'];
  }
}


Future<void> loginWithGoogle(String token) async {
  try {
    final response = await http.post(
        Uri.parse('http://192.168.1.9:5500/api/auth/google'),
        headers: <String, String>{
          'X-API-Key': token,
          'Host': '192.168.1.9:5500',
          'User-Agent': 'PostmanRuntime/7.37.3',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
        });

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('googleToken', token); // Save Google token
    } else {
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}


Future<void> loginWithFacebook(String token) async {
  try {
    final response = await http.post(
        Uri.parse('http://192.168.1.9:5500/api/auth/facebook'),
        headers: <String, String>{
          'X-API-Key': token,
          'Host': '192.168.1.9:5500',
          'User-Agent': 'PostmanRuntime/7.37.3',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
        });

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('facebookToken', token); // Save Facebook token
    } else {
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}

Future<String> resetPassword(
    String password, String passwordConfirmation) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    String token = prefs.getString('token') ?? '';

    var response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/reset-password'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'token': token,
      }),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'host': '127.0.0.1:8000',
        'User-Agent': 'PostmanRuntime/7.37.3',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Accept': 'application/json',
      },
    ).timeout(const Duration(seconds: 10));
    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responseBody['message'];
    } else {
      return responseBody['error'];
    }
  } catch (e) {
    return 'Error occurred: $e';
  }
}


