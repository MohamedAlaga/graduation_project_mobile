import 'dart:convert';
import 'package:http/http.dart' as http;

/// Retrieves user data using the provided token.
///
/// Retrieves the user's personal data from the server using the provided authentication token.
///
/// Parameters:
///   - token: The authentication token of the user.
///
/// Returns:
///   - A JSON string containing the user's data if successful.
///   - A JSON string containing error messages if the request fails.
///
/// Note: On failure, the JSON string contains keys 'email', 'name', 'age', 'phone', and 'father_name' with corresponding error messages.

getUserDate(String token) async {
  try{
    var userData = await http.get(
      Uri.parse(
        'http://10.0.2.2:8000/api/user/getaccount',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding' : 'gzip, deflate, br',
        'Connection' : 'keep-alive',
        'Content-Type': 'application/json',
        'host':"10.2.2.2:8000",
        'Authorization': 'Bearer $token',
      },
    );
    if (userData.statusCode != 200) {
      return jsonEncode(<String, String>{
        'email': "mail",
        'name': "name",
        'age': "age",
        'phone': "phone",
        'father_name': "father_name",
      });
    }
  return userData.body;
}catch(e){
  return jsonEncode(<String, String>{
    'email': "mail",
    'name': "name",
    'age': "age",
    'phone': "phone",
    'father_name': "father_name",
  });
}
}
