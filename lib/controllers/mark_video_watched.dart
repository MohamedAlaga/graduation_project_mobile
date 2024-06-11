// import 'package:http/http.dart' as http;

// Future<void> markVideoAsWatched(int videoId, String token) async {
//   final url = 'http://10.0.2.2:8000/api/videos/$videoId/mark-as-watched';
//   final headers = {
//     'Authorization': 'Bearer $token',
//     'Content-Type': 'application/json',
//   };

//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//     );

//     if (response.statusCode == 200) {
//       print('Video marked as watched');
//     } else {
//       throw Exception(
//           'Failed to mark video as watched: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//     throw Exception('Failed to mark video as watched');
//   }
// }
