import 'package:http/http.dart' as http;
import 'dart:convert';

/// Sends a reset password email to the user.
///
/// Sends a POST request to the server to send a reset password email to the user using the provided email.
///
/// Parameters:
///   - mail: The email of the user.
///
/// Returns:
///   - `true` if the reset password email was sent successfully.
///   - `false` if the user was not found or an error occurred.

 passResetEmailSender(String mail) async{
  try {
    var response = await http.post(
      Uri.parse(
        'http://10.0.2.2:8000/api/forget-password',
      ),
      body: jsonEncode(<String, String>{
        'email': mail,
      }),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding' : 'gzip, deflate, br',
        'Connection' : 'keep-alive',
        'Content-Type': 'application/json',
        'host':"10.2.2.2:8000"
      },
    ).timeout( const Duration(seconds: 10));
    var responseBody = jsonDecode(response.body);
    
    return responseBody['success'];
    }
    catch (e) {
      return e;
    }
}