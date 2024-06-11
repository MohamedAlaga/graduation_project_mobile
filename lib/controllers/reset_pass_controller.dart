import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Resets the user's password.
///
/// Sends a POST request to the server to reset the user's password using the provided email, new password, confirmation password, and token.
///
/// Parameters:
///   - email: The email of the user.
///   - password: The new password of the user.
///   - confirmPassword: The confirmation of the new password.
///   - token: The authentication token of the user.
///
/// Returns:
///   - `true` if the password reset was successful.
///   - `false` if the password reset failed or an error occurred.

resetPasswordController(String email, String password, String confirmPassword, String token) async {
  var requist = await http.post(Uri.parse('$domainName/api/reset-password'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
        'token': token,
      }),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 10));
      try{
      var responseBody = jsonDecode(requist.body);
      if (responseBody['success'] == true){
        return true;
      }
      else{
        return false;
      }
      }catch(e){
        return false;
      }
}