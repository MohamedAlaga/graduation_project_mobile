import 'package:http/http.dart' as http;
import 'dart:convert';

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
  var response = await http.post(
    Uri.parse(
      'http://10.0.2.2:8000/api/login',
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
  );
  var responseBody = jsonDecode(response.body);
  if (responseBody['access_token'] != null) {
    return responseBody['access_token'];
  } else {
    return responseBody['error'];
  }
}
