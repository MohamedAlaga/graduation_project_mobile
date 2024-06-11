import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Updates the user's personal data.
///
/// Sends a POST request to the server to update the user's personal information.
///
/// Parameters:
///   - name: The user's name.
///   - email: The email of the user.
///   - phone: The phone number of the user.
///   - fatherName: The father's name of the user.
///   - age: The age of the user.
///   - token: The authentication token of the user.
///
/// Returns:
///   - `true` if the update was successful.
///   - `false` if the update failed or an error occurred.
///
/// Note: Success is determined by receiving a successful response from the server with a 'success' field set to true.

updateUserPersonalData(String name, String email, String phone,
    String fatherName, String age, String token) async {
  try {
    var response = await http.post(Uri.parse('$domainName/api/user/update'),
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'age': age,
          'phone': phone,
          'father_name': fatherName,
          'password': '12345678',
        }),
        headers: <String, String>{
          'User-Agent': 'mobileApp',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }).timeout(const Duration(seconds: 10));

    var responseBody = jsonDecode(response.body);
    if (responseBody['success'] == true) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
